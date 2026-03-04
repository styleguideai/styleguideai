# Claude Instructions for OCP Reviews

## Trigger Phrases

When the user who wants a "peer review" has been prompted for a product and selected "openshift"

## Task: OpenShift Documentation Peer Review

Perform a comprehensive peer review of the documentation against the following criteria and linked product-specific style guide files.

### Peer Review Checklist

#### General

- [ ] Scan text for obvious typos or very poor wording
- [ ] Check that all links lead to existing pages on the Internet
- [ ] Product titles and version numbers use attributes where appropriate (e.g., `OpenShift` should be `{product-title}` and `4.20` should be `{product-version}`)
- [ ] All `toc::[]` declarations in assemblies are preceded by a blank line
- [ ] All sample code adheres to our standard:
      - [ ] Code blocks should have the source language specified (e.g., `[source,yaml]`)
      - [ ] Terminal commands and sample output should use `[source,terminal]`
      - [ ] CLI commands should be prefaced with `$` or `#` depending on permission level required
- [ ] Each `.adoc` file can contain no more than one H1 (=) heading
- [ ] All xrefs must use complete paths to the referencing doc, include anchor IDs, use the `.adoc` file extension (not `.html`), and be prepended with a suitable prompt
- [ ] Heading anchors use the correct syntax: \[id="module-name\_{context}"\]
- [ ] Assembly-level `== Additional resources` and `== Next steps` titles must have unique IDs
- [ ] Each `== Additional resources` and `== Next steps` section must have a `[role="_additional-resources"]` tag before it. These sections can contain only an unordered list of links and/or xrefs.
- [ ] Sentence case for headings
- [ ] No backticks in headings
- [ ] Headings include only alphanumeric characters (attributes like {my-attribute} that will be replaced are also fine)
- [ ] No new attribute files are allowed
- [ ] File names, CLI commands, and literals are enclosed in backticks and no other markup
- [ ] UI elements are in bold text
- [ ] Avoid linking to GitHub
- [ ] Consider whether an overlong command should be split up with line breaks for readability
- [ ] Check if an include file is referencing an external source, it is referencing a valid URL, and that the inclusion of that URL has been acked by QE, Engineering and Docs. The external source **must not** be an AsciiDoc file and should be restricted to the OpenShift organization on GitHub (The URLs must start with [https://raw.githubusercontent.com/openshift](https://raw.githubusercontent.com/openshift)).
- [ ] Check that lines aren't being hard wrapped at 80 characters (or any other length)
- [ ] Check that source files for auto-generated content, such as the REST API docs (in the rest_api/ folder) and the CLI reference docs (oc-by-example-content.adoc and oc-adm-by-example-content.adoc) weren't updated
- [ ] If the PR reverts another PR, it still needs review. Additionally, confirm that all the changes from the original PR have been reverted.

#### Mod docs templates adherence

- [ ] Asciidoc module files must follow one of the formats of concept, procedure, or reference. One module shouldn't contain several procedures or a mix of procedure and reference.
- [ ] No xrefs in module files. The only exception is release note modules as long as those modules are not reused in another assembly.
- [ ] The commented out metadata of all modules includes a path to one or more assemblies where the module is used
- [ ] Single-step procedure modules use an unordered bullet (`*`) in the procedure section
- [ ] Only one heading per procedure module
- [ ] Every time you set a variable within a module, you must unset it at the end of that module. This is typically done in ifeval statements at the start of a module.
- [ ] Every file includes a content type attribute in the metadata: `:_mod-docs-content-type: <TYPE>`
- [ ] All modules and assemblies must include one H1 and a short description
- [ ] All procedure modules contain no lead-in or additional text throughout or after the procedure steps
- [ ] There is only one procedure per module

#### DITA migration requirements

- [ ] Must have an empty line between H1 heading and first paragraph
- [ ] Must be an empty line between include statements
- [ ] No level 3 headings (===) in any files. Note: ==== for NOTE block delimiters and |=== for table delimiters are acceptable.
- [ ] No additional text surrounding links in the additional resources sections
- [ ] No floating .Headings unless it's above an example, table, figure, or code block, or is an approved block title for procedure modules, such as .Procedure or .Prerequisites.

#### Localization

- [ ] Avoid long sentences, opting for shorter ones with simple structure, minimalism principles are applied
- [ ] Avoid obscure descriptions that could lead to multiple or wrong interpretations that could result in machine translation applying an incorrect interpretation
- [ ] Grammar, spelling, and punctuation follow best practices, to help facilitate machine translation
- [ ] Eliminate redundancies

#### Accessibility

- [ ] Alternative text is present for all images if there are any images
- [ ] Link text is descriptive
- [ ] Tables are properly formed and labeled
- [ ] Color is not used as the sole way of describing information
- [ ] Positional and sensory language are avoided
- [ ] Document sequences are ordered logically, and heading levels are not skipped

#### Exceptions

- [ ] Beware that there may be catalog product-specific style exceptions
- [ ] MicroShift and RHDE can use "offline" to describe use cases where there is no network connectivity. This is a temporary exemption that will be added to the SSG.

### Additional Product-Specific Style Guide Files

The following files contain additional criteria to be used when performing peer reviews:

https://raw.githubusercontent.com/openshift/openshift-docs/refs/heads/main/contributing_to_docs/doc_guidelines.adoc

https://raw.githubusercontent.com/openshift/openshift-docs/refs/heads/main/contributing_to_docs/term_glossary.adoc

https://raw.githubusercontent.com/openshift/openshift-docs/refs/heads/main/contributing_to_docs/contributing.adoc

https://raw.githubusercontent.com/openshift/openshift-docs/refs/heads/main/contributing_to_docs/contributing_user_stories.adoc
