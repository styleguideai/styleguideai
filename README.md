## AI reviewer for technical writers

Prerequisites: You have locally installed Claude Code or Gemini CLI as whitelisted by your corporation.

```
TIP: Even better, use both Claude Code and Gemini CLI because based on a benchmark test (from February 2026) we found that the Gemini 3 model that Gemini CLI uses significantly outperforms Claude's models in catching style guide rule violations.
```

### Setup

To start using AI for peer reviews, set it up as follows:

1. Use the command line to clone this repository to your home directory:
   
   ```terminal
   cd ~ && git clone git@github.com:styleguideai/styleguideai.git
   ```

3. Add permissions to the setup script:
   
   ```terminal
   cd styleguideai && chmod +x setup.sh
   ```

5. Run the setup script:
   
   ```terminal
   bash setup.sh
   ```

### Use

1. Run `claude` or `gemini` from the `styleguideai` directory.

2. Optional: If a command for your product has been added to this repository as a skill, you can enter that command into the prompt to skip any mentions of which repository you are working with.

   Example:

   ```terminal
   /ocp
   ```

   If this command is available for your product, and if you run this command, in the examples in the next step, you don't have to input `in ~/openshift-docs` into the prompt after running `/ocp`.

3. Specify what you want it to review for you.
   
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

```
TIP: For a fast check of only the grammar, spelling, and punctuation, ask for a `quick review` in the prompt. For example:
- do a quick review of unstaged changes in ~/openshift-docs
- do a quick review of staged changes in ~/openshift-docs

```
