# `styleguideai` - Claude Code reviewer for technical writers

You can use Claude Code to quickly review your docs contributions whenever and as often as you need.

Using Claude Code for reviews offers two advantages: it has the functionality to save a review report file locally and then edit the files for you under your close supervision.

> [!CAUTION]
> Treat Claude Code as a quick, well-informed, but error-prone remote intern that requires your oversight and judgement.

## Understand `styleguideai`

`styleguideai` uses Claude Code to review your documentation against style guides and best practices. You specify the content to review: a commit, PR, unstaged changes, or staged changes. Claude Code checks it against multiple style guide sources and then produces a structured report with numbered issues, file locations, violated style rules, and suggested fixes.

Under the hood, PDF style guides are converted into chunked text files that Claude Code can process. Each review mode targets a different set of rules, and a full peer review runs all of them in sequence. See [Review modes](#review-modes) for details.

## Set up `styleguideai`

Prerequisite: You have installed [Claude Code](https://docs.anthropic.com/en/docs/claude-code) in your [terminal](https://code.claude.com/docs/en/quickstart#step-1-install-claude-code) or [IDE](https://code.claude.com/docs/en/vs-code).

To start using Claude Code for reviews, set up a local clone of this repository as follows:

1. Clone this repository to your home directory:
   
   ```terminal
   cd ~ && git clone git@github.com:styleguideai/styleguideai.git
   ```

2. Add permissions to the setup script:
   
   ```terminal
   cd styleguideai && chmod +x setup.sh
   ```

3. Run the setup script:
   
   ```terminal
   bash setup.sh
   ```

> [!TIP]
> When the script prompts you to upload your style guides as PDF files, avoid uploading documents that may have either overlapping guidance or organizational guidance that is not useful to an LLM.

## Get a Claude Code review

Ask Claude Code to review your content and generate a report.

1. Run `claude` from the `styleguideai` directory.

2. Optional: If a `/product` skill exists for your repository, such as `/ocp` for openshift-docs, enter that command at the prompt to skip specifying the repository path in each review request.

   Example:

   ```terminal
   /ocp
   ```

   If this command is available, you do not need to input `in ~/openshift-docs` in the following examples.

3. Specify what you want reviewed.

   Examples:

   ```terminal
   peer review last commit in ~/openshift-docs
   ```

   ```terminal
   peer review commit <commit_sha> in ~/openshift-docs
   ```

   ```terminal
   peer review <github_pr_link>
   ```

   ```terminal
   merge review <github_pr_link>
   ```

   Claude Code saves a review report as a file in the `styleguideai` directory.

> [!TIP]
> For a fast check of only the grammar, spelling, and punctuation, ask for a `quick review` in the prompt. For example:
> - `do a quick review of unstaged changes in ~/openshift-docs`
> - `do a quick review of staged changes in ~/openshift-docs`

## Fix issues from the review

Prerequisite: Claude Code has generated a review report file.

Use Claude Code to update your files under your close supervision to fix issues it found.

> [!TIP]
>  You can simply continue the session because Claude Code still remembers all the issues. Alternatively, you can start a new session later and ask Claude Code to read the review report file that you specify in the prompt by the file name.

1. Ask Claude Code to go through the issues one by one:

   Example:
   ```terminal
   Let's go through the issues one by one.
   Ask me for every issue: Apply, skip, or modify?
   ```

2. For each issue, evaluate the suggestion and type one of the following:

   ```terminal
   apply
   skip
   <modify_as_...>  # explain the changes that you want to its suggestion or enter your own suggestion
   ```

3. When you have reviewed all the issues, manually review, commit, and push the changes in Git.

## Review modes

| Mode | Trigger phrase | What it checks |
|------|---------------|----------------|
| **Peer review** | `peer review` | Comprehensive review against all applicable style guide sources (PDF chunks, SSG, Vale, mod docs, and product-specific rules) |
| **Quick review** | `quick review` | Grammar, spelling, and punctuation only |
| **PDF review** | `pdf review` | Style rules extracted from PDF style guide chunks in `./chunks/` |
| **SSG review** | `ssg review` | Red Hat Supplementary Style Guide compliance |
| **Vale review** | `vale review` | Vale linting tool output (requires Vale installed locally) |
| **Mod docs review** | `mod docs review` | Red Hat modular documentation structure compliance |
| **Merge review** | `merge review` | High-level review for merge request readiness (product-specific) |

## Key files

| File | Purpose |
|------|---------|
| `CLAUDE.md` / `GEMINI.md` | AI instructions for review generation |
| `review-report-format.md` | Standardized review report output format |
| `product/` | Product-specific review checklists and style rules |
| `.claude/skills/` | Named skills for product-specific context switching |
