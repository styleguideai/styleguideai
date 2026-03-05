## AI reviewer for technical writers

Prerequisites: You have locally installed Claude Code or Gemini CLI as whitelisted by your corporation.

```
TIP: Use both Claude Code and Gemini CLI but for different tasks.
```

### Setting up your local AI app for reviews

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

### Getting an AI review of your own work

The local AI app, Claude Code or Gemini, can quickly peer-review your work whenever and as often as you need.

```
TIP: If Gemini CLI is whitelisted by your corporation, use Gemini CLI for producing review reports because based on a benchmark test (from February 2026) we found that the Gemini 3 model that Gemini CLI uses significantly outperforms Claude's models in catching style guide rule violations.
```

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

   The local AI app will save a review report in the same directory.

```
TIP: For a fast check of only the grammar, spelling, and punctuation, ask for a `quick review` in the prompt. For example:
- do a quick review of unstaged changes in ~/openshift-docs
- do a quick review of staged changes in ~/openshift-docs

```

### Fixing the issues discovered in the AI review

You can use the local AI app to fix the issues discovered in the AI review report.

Prerequisites:

- If you choose to use the same local AI app to fix the issues that it found in its review, you can simply continue the session, and it still remembers all the issues.

- If you choose to use the other local AI app, such as Claude Code if you used Gemini CLI to produce the review report, then start a new session and ask it to read the review report file.

```
TIP: If Claude Code is whitelisted by your corporation, use Claude Code for fixing the issues listed in the review report file.
```

1. Ask the local AI app to go through the issues one by one:

   Example:
   ```terminal
   Let's go through the issues one by one.
   Ask me for every issue: Apply, skip, or modify?
   ```

2. The local AI app shows you the issue. Read the issue. Evaluate the suggestion, and type one of the following:
   ```terminal
   Let's go through the issues one by one.
   apply # just one word is sufficient
   skip # just one word is sufficient
   <modify_as_...> # explain the changes that you want to be made to the AI suggestion or make your own, alternative suggestion
   ```

3. When you have reviewed all the issues, you then manually review, commit, and push the changes in Git.
