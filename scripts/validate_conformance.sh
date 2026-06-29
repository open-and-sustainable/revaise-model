#!/usr/bin/env bash
# Validate a protocol's RDF example records against its SHACL shapes.
# SHACL reads RDF directly, so records under test are authored in Turtle — no conversion.
#
# Convention: <protocol>/*.shacl.ttl, <protocol>/examples/conforming.ttl (must CONFORM),
#             <protocol>/examples/non-conforming.ttl (must produce VIOLATIONS).
# Requires: pyshacl on PATH.
# Usage: scripts/validate_conformance.sh [protocol_dir]   (default: protocols/prisma-2020)
set -euo pipefail

PROTO_DIR="${1:-protocols/prisma-2020}"
SHAPES="$(ls "$PROTO_DIR"/*.shacl.ttl | head -1)"
fail=0

check() { # <ttl> <expected: conform|violate>
    local ttl="$1"
    local expect="$2"
    [ -f "$ttl" ] || { echo "skip: $ttl not found"; return; }
    if pyshacl -s "$SHAPES" "$ttl" >/dev/null 2>&1; then
        result="conform"
    else
        result="violate"
    fi
    if [ "$result" = "$expect" ]; then
        echo "PASS  $(basename "$ttl") -> $result"
    else
        echo "FAIL  $(basename "$ttl") -> $result (expected $expect)"
        fail=1
    fi
}

echo "Protocol: $PROTO_DIR (shapes: $(basename "$SHAPES"))"
check "$PROTO_DIR/examples/conforming.ttl" conform
check "$PROTO_DIR/examples/non-conforming.ttl" violate
exit $fail
