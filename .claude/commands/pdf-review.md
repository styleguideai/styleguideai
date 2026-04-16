<!--
You can use this command with the following arguments:

- /pdf-review https://github.com/org/repo/pull/123 - review a PR by URL
- /pdf-review #123 or /pdf-review 123 - review a PR by number
- /pdf-review HEAD~1 - review a commit
- /pdf-review path/to/file.adoc - review a file
- /pdf-review - review the latest commit (default)
-->

# Parallel PDF Style Review Workflow

This command performs a parallelized PDF style review where multiple agents process chunk files concurrently.

## Content to Review

$ARGUMENTS

Interpret the argument as follows:
- If it's a GitHub PR URL (e.g., `https://github.com/org/repo/pull/123`): use `gh pr diff <number>` to get the diff
- If it's a PR number (e.g., `#123` or `123`): use `gh pr diff <number>` to get the diff
- If it's a commit reference (e.g., `HEAD`, `HEAD~1`, `abc123`): review that commit's diff
- If it's a commit range (e.g., `HEAD~3..HEAD`): review the diff for that range
- If it's a file path (e.g., `docs/guide.adoc`): review that file's content
- If it's a glob pattern (e.g., `modules/**/*.adoc`): review all matching files
- If empty or not provided: review the latest commit (HEAD)

## Overview

Instead of sequentially reading all style guide chunk files and analyzing content against each, this workflow:
1. Lists all chunk files in the ./chunks/ directory
2. Spawns multiple parallel agents (one per chunk)
3. Each agent analyzes the commit content against its assigned chunk's rules
4. Each agent writes findings to a separate temporary file
5. A final merge step combines all findings into the review report

## Instructions

### Phase 1: Setup

1. Create the main review report file `review-<YYYY-MM-DD-hh:mm:ss>.md` with the header:
   ```
   AI review report
   (Do not use preview to read this report unless your previews are set to a monospace font.)

   **User request:** <user's request>

   **Commit:** <commit hash>
   **Subject:** <commit subject>
   ```

2. List all chunk files in `./chunks/` directory and its subdirectories:
   ```
   ls ./chunks/
   ```
   Store the list of chunk filenames for spawning agents.

3. Retrieve the commit diff content and save it to a temporary file:
   ```
   ~/styleguideai/temp-commit-diff.txt
   ```

4. Create a temporary directory for chunk findings:
   ```
   ~/styleguideai/temp-violations/
   ```

### Phase 2: Parallel Analysis

Launch parallel agents using the Task tool - one agent per chunk file found in Phase 1. Each agent receives:

**Agent Prompt Template:**
```
You are analyzing documentation content for style guide violations.

1. Read the chunk file: ./chunks/<CHUNK_FILENAME>
2. Read the commit diff: ./temp-commit-diff.txt
3. Read the review report format: ./review-report-format.md

4. Analyze every sentence in the commit diff against ALL rules in your assigned chunk.

5. Return your findings in your response (do NOT write to any files). Use this format:

   CHUNK: <CHUNK_FILENAME>
   VIOLATIONS_FOUND: <number>

   If violations found, list each one:
   ---VIOLATION---
   FILE: <filename>
   CURRENT: <sentence where violation appears>
   SUGGESTED: <corrected sentence>
   RULE: <first sentence of the style rule>
   TOCPATH: <Style Guide Name> > <Section> > <Subsection>
   ---END---

   If no violations found, return:
   CHUNK: <CHUNK_FILENAME>
   VIOLATIONS_FOUND: 0
   NO_VIOLATIONS_REASON: <brief explanation of what rules were checked>
```

**Parallel Execution:**
- Use a single message with multiple Task tool invocations
- Set subagent_type to "general-purpose"
- Each agent handles exactly one chunk file
- Agents return findings in their response (no file writes needed)
- No permission issues since agents don't write files

### Phase 3: Merge Results

After all parallel agents complete:

1. Parse each agent's response to extract violations:
   - Look for the `---VIOLATION---` markers in agent results
   - Extract FILE, CURRENT, SUGGESTED, RULE, TOCPATH fields
   - Skip agents with `VIOLATIONS_FOUND: 0`

2. Combine findings into the main review report file:
   - Renumber all issues sequentially (Issue 1, Issue 2, etc.)
   - Convert to the format from review-report-format.md
   - Deduplicate issues that flag the same sentence

3. Append "End of report" to the review report file

4. Clean up temporary files:
   - Delete `./temp-commit-diff.txt`

## Fallback

If parallel execution is not possible or fails, fall back to the sequential approach defined in CLAUDE.md.
