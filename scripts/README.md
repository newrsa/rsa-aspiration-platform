# Automation Scripts

Place registry validation and artifact generators here. Scripts must be deterministic and should not overwrite reviewed artifacts without an explicit output path.

`validate_registry.py` is the initial dependency-free registry quality gate. It validates required catalog fields, entity IDs, and relationship endpoints.
