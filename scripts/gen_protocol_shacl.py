#!/usr/bin/env python3
"""Generate SHACL shapes for a protocol from its checklist.

Reads a checklist YAML (plain item list: item, section, topic, text, optional shacl block)
and produces SHACL property shapes for each item that carries a shacl block. Items without
a shacl block are skipped.

Usage:
    python scripts/gen_protocol_shacl.py <checklist.yaml> <output.shacl.ttl>
"""
import sys
from pathlib import Path

import yaml

XSD = {
    "integer": "xsd:integer",
    "string": "xsd:string",
    "boolean": "xsd:boolean",
    "date": "xsd:date",
    "datetime": "xsd:dateTime",
    "decimal": "xsd:decimal",
    "float": "xsd:float",
    "uri": "xsd:anyURI",
}


def _ttl_escape(text):
    return text.replace("\\", "\\\\").replace('"', '\\"')


def render_property(shacl):
    c = shacl.get("constraints", {}) or {}
    lines = [f'        sh:path revaise:{shacl["path"]}']
    if "min_count" in c:
        lines.append(f'        sh:minCount {int(c["min_count"])}')
    if "max_count" in c:
        lines.append(f'        sh:maxCount {int(c["max_count"])}')
    if "datatype" in c:
        lines.append(f'        sh:datatype {XSD[c["datatype"]]}')
    if "min_inclusive" in c:
        lines.append(f'        sh:minInclusive {c["min_inclusive"]}')
    if "max_inclusive" in c:
        lines.append(f'        sh:maxInclusive {c["max_inclusive"]}')
    if "less_than_or_equals" in c:
        lines.append(f'        sh:lessThanOrEquals revaise:{c["less_than_or_equals"]}')
    if "class" in c:
        lines.append(f'        sh:class revaise:{c["class"]}')
    if "in" in c:
        vals = " ".join(f'"{_ttl_escape(str(v))}"' for v in c["in"])
        lines.append(f"        sh:in ( {vals} )")
    if "pattern" in c:
        lines.append(f'        sh:pattern "{_ttl_escape(c["pattern"])}"')
    lines.append(f'        sh:severity sh:{shacl.get("severity", "Violation")}')
    lines.append(f'        sh:message "{_ttl_escape(shacl["message"])}"')
    return "    sh:property [\n" + " ;\n".join(lines) + " ;\n    ]"


def generate(checklist_path):
    data = yaml.safe_load(Path(checklist_path).read_text())
    proto = data["protocol"]
    ns = data["namespace"]
    shapes_ns = data["shapes_namespace"]
    items = data["items"]

    groups, order = {}, []
    for it in items:
        shacl = it.get("shacl")
        if not shacl:
            continue
        tc = shacl["target_class"]
        if tc not in groups:
            groups[tc] = []
            order.append(tc)
        path = shacl["path"]
        if not any(s["path"] == path for s in groups[tc]):
            groups[tc].append(shacl)

    out = [
        f"# {proto} — SHACL shapes GENERATED from checklist.yaml. DO NOT EDIT BY HAND.",
        f"# Regenerate: python scripts/gen_protocol_shacl.py <checklist.yaml> <output.shacl.ttl>",
        "",
        "@prefix sh:      <http://www.w3.org/ns/shacl#> .",
        "@prefix xsd:     <http://www.w3.org/2001/XMLSchema#> .",
        f"@prefix revaise: <{ns}> .",
        f"@prefix proto:   <{shapes_ns}> .",
        "",
    ]
    for tc in order:
        props = " ;\n".join(render_property(s) for s in groups[tc])
        out.append(
            f"proto:{tc}Shape\n    a sh:NodeShape ;\n    sh:targetClass revaise:{tc} ;\n{props} ."
        )
        out.append("")
    return "\n".join(out).rstrip() + "\n"


def main(argv):
    if len(argv) != 3:
        sys.exit("usage: gen_protocol_shacl.py <checklist.yaml> <output.shacl.ttl>")
    Path(argv[2]).write_text(generate(argv[1]))


if __name__ == "__main__":
    main(sys.argv)
