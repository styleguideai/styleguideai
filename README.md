# styleguideai

An AI-powered peer review system for technical writers.

> [!CAUTION]
> The AI reviewer is fast and well-informed, but treat its suggestions as a starting point that requires your judgment and oversight.

## Understand styleguideai

styleguideai uses Claude Code and Gemini CLI to review your documentation against style guides and best practices. You specify the content to review — a commit, a PR, staged changes — and the AI checks it against multiple style guide sources, then produces a structured report with numbered issues, file locations, and suggested fixes.

Under the hood, PDF style guides are converted into chunked text files that the AI can process. Each review mode targets a different set of rules, and a full peer review runs all of them in sequence. See [Review modes](#review-modes) for details.

## Set up styleguideai

Prerequisites: You have installed [Claude Code](https://docs.anthropic.com/en/docs/claude-code) or [Gemini CLI](https://github.com/google-gemini/gemini-cli), as approved by your project for use with proprietary content.

1. Clone this repository to your home directory:

   ```terminal
   cd ~ && git clone git@github.com:styleguideai/styleguideai.git
   ```

2. Run the setup script:

   ```terminal
   cd styleguideai && bash setup.sh
   ```

## Get an AI review

> [!TIP]
> Use both Claude Code and Gemini CLI but for different tasks. If Gemini CLI is approved by your project, use it for producing review reports. A February 2026 benchmark test found that the Gemini 3 model significantly outperforms Claude's models in catching style guide rule violations.

1. Run `claude` or `gemini` from the `styleguideai` directory.

2. Specify what you want reviewed.

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

   The AI saves a review report in the same directory.

> [!TIP]
> If a `/product` skill exists for your repository (for example, `/ocp` for openshift-docs), enter that command at the prompt to skip specifying the repository path in each review request.

> [!TIP]
> For a fast check of only the grammar, spelling, and punctuation, ask for a `quick review` in the prompt. For example:
> - `do a quick review of unstaged changes in ~/openshift-docs`
> - `do a quick review of staged changes in ~/openshift-docs`

## Fix issues from the review

> [!TIP]
> If Claude Code is approved by your project, use Claude Code for fixing the issues listed in the review report file.

To fix the issues that the AI found:

- If you use the same AI app that produced the review, continue the session — it still remembers all the issues.
- If you use a different AI app, start a new session and ask the app to read the review report file.

1. Ask the AI to go through the issues one by one:

   ```terminal
   Let's go through the issues one by one.
   Ask me for every issue: Apply, skip, or modify?
   ```

2. For each issue, evaluate the suggestion and type one of the following:

   ```terminal
   apply
   skip
   <modify_as_...>  # explain the changes you want or make your own suggestion
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
