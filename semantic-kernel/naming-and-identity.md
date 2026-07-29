# Naming and Identity Standard

## Names

- Entity names and Neo4j labels: singular PascalCase (for example, `EntranceExam`).
- Relationship names: uppercase snake case (for example, `LEADS_TO`).
- Property names: `snake_case`, consistent with the GAS convention described in the project context.
- Registry IDs: uppercase stable identifiers defined in the registry workflow.

## Identity

Every governed entity must declare:

- a stable registry ID;
- an immutable domain reference code where the source model provides one;
- a UUID/runtime identifier if the selected runtime requires one;
- governance metadata including version, owner, status, and source authority.

Runtime IDs are implementation details. Reference codes and registry IDs preserve semantic traceability across implementations.
