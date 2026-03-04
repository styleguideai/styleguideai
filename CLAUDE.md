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
  8. Prompt the user for the product name by offering the user to select among the subdirectory names in ./product/*
  9. Use the files in the subdirectory in ./product/* that the user has selected

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
