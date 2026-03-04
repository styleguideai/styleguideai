This file can be used by humans and a locally installed Claude Code and Gemini CLI!

# Instructions about the Review Report File

## Task: Create a Unique Review Report File

Instructions:

  1. Create a new file `review-<YYYY-MM-DD-hh:mm:ss>.md`, which means `review-<date +"%Y-%m-%d-%H:%M:%S">.md`
  2. Prepend the request that the user entered into the prompt
  3. For your review output, use the format specified in ./review-report-format.md
  4. Perform the requested review
  5. When your review is complete, append your review output to this file

# Instructions for Peer Reviews

## Trigger Phrases

When the user says "peer review"

## Task: Peer Review 

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. For each of the trigger phrases in this list, do not create a new file, instead append the report to the file that you created in the previous step of this list of instructions ("1. Read and execute the section # Claude Instructions about the Review Report File")
  3. Act according to the trigger phrase "quick review"
  4. Act according to the trigger phrase "vale review"
  5. Act according to the trigger phrase "mod docs review"
  6. Act according to the trigger phrase "pdf review"
  7. Act according to the trigger phrase "ssg review"
  8. Act according to the trigger phrase "ocp review"

---

# Instructions for Quick Reviews

## Trigger Phrases

When the user says "quick review"

## Task: Quick Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. Review the grammar, spelling, and punctuation in the provided content
  3. Document your findings in the results file with:
    - A clear section header
    - All violations found, including:
        - Specific line number(s) where the issue occurs
      - The problematic text
      - Define the violation
      - Suggested correction
  4. After reviewing all of the provided content, append a comprehensive summary section that includes:
    - All critical issues that must be fixed
    - Recommendations for improvements
    - Document statistics (total issues found, categorized by severity)
    - Overall compliance assessment
	- Final summary of all findings

---

# Instructions for Vale Reviews

## Trigger Phrases

When the user says "vale review"

## Task: Vale Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. On the content that the user has specified in the prompt, update `vale`, run the `vale --output line` command, analyze its output, and ignore false positives.
  3. Read https://raw.githubusercontent.com/jhradilek/asciidoctor-dita-vale/refs/heads/main/README.md
  4. Read 
  5. Document your findings in the results file with:
    - A clear section header
    - All violations found, including:
        - Specific line number(s) where the issue occurs
      - The problematic text
      - Define the violation
      - Suggested correction
  6. After reviewing all of the provided content, append a comprehensive summary section that includes:
    - All critical issues that must be fixed
    - Recommendations for improvements
    - Document statistics (total issues found, categorized by severity)
    - Overall compliance assessment
	- Final summary of all findings

---

# Instructions for Mod Docs Reviews 

## Trigger Phrases

When the user says "mod docs review"

## Task: Mod Docs Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. Review the content specified in the prompt against all style rules in the local clone of `modular-docs.git`.
  3. Document your findings in the results file with:
    - A clear section header
    - All violations found, including:
        - Specific line number(s) where the issue occurs
      - The problematic text
      - Define the violation
      - Suggested correction
  4. After reviewing all of the provided content, append a comprehensive summary section that includes:
    - All critical issues that must be fixed
    - Recommendations for improvements
    - Document statistics (total issues found, categorized by severity)
    - Overall compliance assessment
	- Final summary of all findings

---

# Instructions for PDF Style Reviews

## Trigger Phrases

When the user says "pdf review"

## Task: PDF Style Review

Input:

  - Content to review: as specified in the prompt
  - Style guide chunks: All files in the directory ./chunks/* and its subdirectories

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. Review the provided content against each PDF Style guide chunk file sequentially (one chunk at a time)
  3. For each chunk, document your findings in the results file with:
    - A clear section header identifying which chunk was reviewed and its main topic area
    - All style violations found, including:
        - Specific line number(s) where the issue occurs
      - The problematic text
      - Why it violates the style guide (with reference to the specific rule)
      - Suggested correction
  4. After reviewing all chunks, append a comprehensive summary section that includes:
    - All critical issues that must be fixed
    - Recommendations for improvements
    - Document statistics (total issues found, categorized by severity)
    - Overall compliance assessment
	- Final summary of all findings

---

# Claude Instructions for SSG Reviews

## Trigger Phrases

When the user says "ssg review"

## Task: Quick Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. Review the content specified in the prompt against all style rules in the local clone of `supplementary-style-guide.git`.
  3. Document your findings in the results file with:
    - A clear section header
    - All violations found, including:
        - Specific line number(s) where the issue occurs
      - The problematic text
      - Define the violation
      - Suggested correction
  4. After reviewing all of the provided content, append a comprehensive summary section that includes:
    - All critical issues that must be fixed
    - Recommendations for improvements
    - Document statistics (total issues found, categorized by severity)
    - Overall compliance assessment
	- Final summary of all findings

---

# Claude Instructions for OCP Reviews

## Trigger Phrases

When the user says "ocp review"

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

## Instructions

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. When the user requests a peer review, identify the files or PR to review
  3. Read the documentation content thoroughly
  4. Fetch and review the additional product-specific style guide files listed above
  5. Go through each checklist item systematically
  6. Report findings for each item clearly with specific examples and line references
  7. Provide a summary of what passes and what needs attention
  8. Format the output as a checklist with clear pass/fail indicators

---

# Instructions for Merge Reviews

## Trigger Phrases

When the user says "merge review"

## Task: OpenShift Documentation Merge Review

Perform a comprehensive review of the pull request against the following checklist:

### OCP Docs Repo Merge Request Checklist

- [ ] The PR title and first comment are in the format that is described in the PR template, and a correctly formatted PR title and comment looks like this: https://github.com/openshift/openshift-docs/pull/51056
- [ ] PR contains only one commit
- [ ] The PR description specifies versions, includes a link to the JIRA issue and a deep link to the Netlify preview
- [ ] QE approval box is ticked, with following exceptions:
  - Non-technical updates (fixing broken links, basic typos, or formatting issues) do not need QE review
  - No QE or SME is required for core OCP z-stream release note PRs or core OCP y-stream release note bug fixes
- [ ] A peer review done and approval received
- [ ] All conversations in the PR marked as "Resolved"
- [ ] "WIP" label is removed from title or comments
- [ ] Check that all system tests have passed on the PR (the openshift-ci bot should say "all tests passed!")

Instructions:

  1. Read and execute the section # Claude Instructions about the Review Report File
  2. When the user provides a PR URL or number, fetch the PR details using the `gh` command with JSON output including: title, body, number, commits, reviews, state, author, labels, comments, and statusCheckRollup
  3. Download the PR webpage using curl to check conversation thread resolution status:
	 - Use: `curl -s "https://github.com/openshift/openshift-docs/pull/{PR_NUMBER}" > /tmp/pr-{PR_NUMBER}.html`
	 - Search for unresolved conversations: `grep -c 'data-resolved="false"' /tmp/pr-{PR_NUMBER}.html`
	 - This provides an exact count of unresolved conversation threads
  4. Go through each checklist item systematically:
	 - PR title and format: Check title matches `JIRA-ID: Description` pattern
	 - Commit count: Verify only 1 commit exists
	 - PR description: Verify presence of versions, JIRA link, and Netlify deep link
	 - QE approval: Check if checkbox is ticked in PR description (look for `- [x]` vs `- [ ]`)
	 - Peer review: Check reviews array for approved status
	 - Conversation threads: Use the curl/grep method to find unresolved threads
	 - WIP label: Check labels array and title for "WIP"
	 - System tests: Check statusCheckRollup for all SUCCESS states and look for openshift-ci bot comment
  5. Report findings for each item clearly using checkmarks: [✔] for pass, [⚠️] for partial pass with issues, [❌] for fail
  6. Provide a summary of what passes and what needs attention
  7. Format the output as a markdown checklist with clear pass/fail indicators
