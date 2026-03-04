## AI reviewer for technical writers

Prerequisites: You have locally installed Claude Code or Gemini CLI as whitelisted by your corporation.

**TIP:** Even better, use both Claude Code and Gemini CLI because based on a benchmark test (from February 2026) we found that the Gemini 3 model that Gemini CLI uses significantly outperforms Claude's models in catching style guide rule violations.

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

2. Specify what you want it to review for you.
   
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
