This file is intended for a locally installed Claude Code and Gemini CLI.

# Instructions about the Review Report File

## Task: Create a Unique Review Report File

Instructions:

  1. Create a new file `review-<YYYY-MM-DD-hh:mm:ss>.md`, which means `review-<date +"%Y-%m-%d-%H:%M:%S">.md`
  2. Prepend the request that the user entered into the prompt
  3. For your review output, adhere STRICTLY AND ONLY to the format specified in ./review-report-format.md, and do not add any information (such as "Summary" or "Key findings") or formatting (such as tables) that is not explicitly defined in ./review-report-format.md!
  4. Perform the requested review
  5. When your review is complete, append your review output to this file

# Instructions for Peer Reviews

## Trigger Phrases

When the user says "peer review"

## Task: Peer Review 

Instructions:

  1. Read and execute the section # Instructions about the Review Report File
  2. Skip re-reading any sources that you have already read and have in your context
  3. For each of the trigger phrases in this list, do not create a new file, instead append the report to the file that you created in the previous step of this list of instructions ("1. Read and execute the section # Claude Instructions about the Review Report File")
  4. Each of the style guide sources contains a plurality of rules. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence.
  5. Act according to the trigger phrase "pdf review"
  6. Act according to the trigger phrase "ssg review"
  7. Act according to the trigger phrase "vale review"
  8. Act according to the trigger phrase "mod docs review"
  9. For product-specific guidance, check if there is a product entry for this documentation repository in ./product. If product-specific guidance for this product exists in ./product, then use it. If not, then prompt the user as follows:
      "
       I did not find any product-specific style guides.
       You can provide them to me now in the prompt
       or open a PR to add them to
       https://github.com/styleguideai/styleguideai/tree/main/product/.
      "
  11. Use the files in the subdirectory in ./product/* that the user has selected

---

# Instructions for PDF Style Reviews

## Trigger Phrases

When the user says "pdf review"

## Task: PDF Style Review

Input:

  - Content to review: as specified in the prompt
  - Style guide chunks: All files in the directory ./chunks/* and its subdirectories

Instructions:

  1. Read and execute the section # Instructions about the Review Report File
  2. Review the provided content against each PDF Style guide chunk file sequentially (one chunk at a time)
  3. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence
  4. Append the results to the review report file

---

# Instructions for SSG Reviews

## Trigger Phrases

When the user says "ssg review"

## Task: Quick Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Instructions about the Review Report File
  2. Read https://redhat-documentation.github.io/supplementary-style-guide/ssg.md
  3. Review the content specified in the prompt against all style rules in ssg.md
  4. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence
  5. Append the results to the review report file

---

# Instructions for Vale Reviews

## Trigger Phrases

When the user says "vale review"

## Task: Vale Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Check if `vale` command is installed. If the `vale` command is not installed, abort and ask the user to install Vale.
  2. Read and execute the section # Instructions about the Review Report File
  3. On the content that the user has specified in the prompt, update `vale`, run the `vale --output line` command, analyze its output, and ignore false positives.
  4. Read https://raw.githubusercontent.com/jhradilek/asciidoctor-dita-vale/refs/heads/main/README.md
  5. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence
  6. Append the results to the review report file

---

# Instructions for Quick Reviews

## Trigger Phrases

When the user says "quick review"

## Task: Quick Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Instructions about the Review Report File
  2. Review the grammar, spelling, and punctuation in the provided content
  3. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence
  4. Append the results to the review report file

---

# Instructions for Mod Docs Reviews 

## Trigger Phrases

When the user says "mod docs review"

## Task: Mod Docs Review

Input:

  - Content to review: as specified in the prompt

Instructions:

  1. Read and execute the section # Instructions about the Review Report File
  2. Read the following source by using the following command: $ lynx -dump -nolist https://redhat-documentation.github.io/modular-docs/
  3. You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence
  4. Append the results to the review report file
