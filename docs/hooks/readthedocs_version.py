"""
MkDocs macros module to populate version information from ReadTheDocs environment variables.

This module works with mkdocs-macros-plugin to provide version information
to MkDocs templates via variables and macros.
"""

import os


def define_env(env):
    """
    Hook function for mkdocs-macros-plugin.

    This function is called by the macros plugin and allows us to define
    variables, macros, and filters that will be available in MkDocs templates.
    """

    # Get version from ReadTheDocs environment variable
    # READTHEDOCS_VERSION contains the version being built (e.g., "latest", "stable", "v1.0.0")
    rtd_version = os.environ.get('READTHEDOCS_VERSION', 'latest')

    # Get additional ReadTheDocs information if available
    rtd_version_name = os.environ.get('READTHEDOCS_VERSION_NAME', rtd_version)
    rtd_version_type = os.environ.get('READTHEDOCS_VERSION_TYPE', 'branch')

    # Make version information available as template variables
    env.variables['version'] = rtd_version_name
    env.variables['rtd_version'] = rtd_version
    env.variables['rtd_version_type'] = rtd_version_type

    # Add a human-readable version description
    if rtd_version == 'latest':
        version_description = 'Latest Development Version'
    elif rtd_version == 'stable':
        version_description = 'Latest Stable Release'
    elif rtd_version_type == 'tag':
        version_description = f'Release {rtd_version_name}'
    else:
        version_description = f'Branch: {rtd_version_name}'

    env.variables['version_description'] = version_description

    # Also add to config.extra for backward compatibility
    if 'extra' not in env.conf:
        env.conf['extra'] = {}

    env.conf['extra']['version'] = rtd_version_name
    env.conf['extra']['rtd_version'] = rtd_version
    env.conf['extra']['rtd_version_type'] = rtd_version_type
    env.conf['extra']['version_description'] = version_description


def on_config(config):
    """
    Fallback hook for when used directly as a hook instead of with macros plugin.

    This function reads the ReadTheDocs version from environment variables
    and adds it to the MkDocs configuration so it can be used in templates.
    """
    # Get version from ReadTheDocs environment variable
    rtd_version = os.environ.get('READTHEDOCS_VERSION', 'latest')
    rtd_version_name = os.environ.get('READTHEDOCS_VERSION_NAME', rtd_version)
    rtd_version_type = os.environ.get('READTHEDOCS_VERSION_TYPE', 'branch')

    # Initialize extra dict if it doesn't exist
    if 'extra' not in config:
        config['extra'] = {}

    # Add version information to config.extra
    config['extra']['version'] = rtd_version_name
    config['extra']['rtd_version'] = rtd_version
    config['extra']['rtd_version_type'] = rtd_version_type

    # Add a human-readable version description
    if rtd_version == 'latest':
        config['extra']['version_description'] = 'Latest Development Version'
    elif rtd_version == 'stable':
        config['extra']['version_description'] = 'Latest Stable Release'
    elif rtd_version_type == 'tag':
        config['extra']['version_description'] = f'Release {rtd_version_name}'
    else:
        config['extra']['version_description'] = f'Branch: {rtd_version_name}'

    return config
