---
name: ocp
description: Focuses all operations and file searches on the local clone of the OpenShift documentation repository at ~/openshift-docs. Use when working on openshift-docs content or when the user explicitly requests the OCP context.
---

# OpenShift Documentation Repository Focus

Apply the following rules to all operations when this skill is active:

1. Use `~/openshift-docs` as the base directory for all file operations and shell commands.
2. Resolve all relative file paths against the `~/openshift-docs` root.
