## AI reviewer for technical writers

This README describes a local AI app setup and workflow for reviews and fixes.

Using a local AI app offers two advantages: the local AI app has the functionality to save a review report file locally and then edit the files on your behalf and under your close supervision in response to the AI review that a local AI app has produced.

```
TIP: Use a locally installed AI app as your reviewer, but treat it as a quick, well-informed, but error-prone remote intern that you must micromanage.
```

Prerequisites: You have installed Claude Code or Gemini CLI as whitelisted by your project.

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

   ```
   TIP: When the script prompts you to upload your style guides as PDF files, avoid uploading documents that may have either overlapping guidance or organizational guidance that is not useful to an LLM.
   ```

### Getting an AI review of your own work

The local AI app can quickly peer-review your work as many times as you need.

```
TIP: If Gemini CLI is whitelisted by your project, use it for producing review reports. A February 2026 benchmark test found that the Gemini 3 model significantly outperforms Claude's models in catching style guide rule violations.
```

1. Run `claude` or `gemini` from the `styleguideai` directory.

2. Optional: If a command for your product has been added to this repository as a skill, you can enter that command into the prompt to skip any mentions of which repository you are working with.

   Example:

   ```terminal
   /ocp
   ```

   If this command is available, you do not need to input `in ~/openshift-docs` in the following examples.

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

   The local AI app saves a review report in the same directory.

### Fixing the issues discovered in the AI review

The local AI app can update the files to fix issues discovered in the AI review.

Prerequisites:

- If you choose to use the same local AI app to fix the issues that it found in its review, you can simply continue the session, and it still remembers all the issues.

- If you use a different AI app to fix issues, start a new session, and ask the app to read the review report file.

```
TIP: If Claude Code is whitelisted by your project, use Claude Code for fixing the issues listed in the review report file.
```

1. Ask the local AI app to go through the issues one by one:

   Example:
   ```terminal
   Let's go through the issues one by one.
   Ask me for every issue: Apply, skip, or modify?
   ```

2. The local AI app shows you the issue. Read the issue. Evaluate the suggestion, and type one of the following:
   ```terminal
   apply # just one word is sufficient
   skip # just one word is sufficient
   <modify_as_...> # explain the changes that you want to be made to the AI suggestion or make your own, alternative suggestion
   ```

3. When you have reviewed all the issues, manually review, commit, and push the changes in Git.
