## Claude Code reviewer for technical writers

You can use Claude Code to review your docs contributions.

Using Claude Code for reviews offers two advantages: it has the functionality to save a review report file locally and then edit the files for you under your close supervision.

Prerequisites: You have installed Claude Code.

```
TIP: Treat Claude Code as a quick, well-informed, but error-prone remote intern that you must micromanage. 
```

### Setting up Claude Code for reviews

To start using Claude Code for reviews, set up a local clone of this repository as follows:

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

### Getting a Claude Code review of your own work

Claude Code can quickly peer-review your work as many times as you need.

1. Run `claude` from the `styleguideai` directory.

2. Optional: If a command for your product has been added to this repository as a skill, you can enter that command into the prompt to skip any mentions of which repository you are working with.

   Example:

   ```terminal
   /ocp
   ```

   If this command is available, you do not need to input `in ~/openshift-docs` in the following examples.

3. Specify what you want Claude Code to review for you.
   
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

<<<<<<< HEAD
   The local AI app saves a review report in the same directory.
=======
   Claude Code saves a review report in the same directory.
>>>>>>> b6d0e94 (update README.md to focus exclusively on Claude Code and remove GEMINI.md)

### Fixing the issues discovered by Claude Code in its review

Claude Code can update the files to fix issues discovered in its review.

Prerequisites:

- Claude Code generated a review report file.

```
TIP: You can simply continue the session, and Claude Code still remembers all the issues. Alternatively, you can start a new session and ask Claude Code to read the review report file that you specify in the prompt by the file name.
```

1. Ask Claude Code to go through the issues one by one:

   Example:
   ```terminal
   Let's go through the issues one by one.
   Ask me for every issue: Apply, skip, or modify?
   ```

2. Claude Code shows you the issue. Read the issue. Evaluate the suggestion, and type one of the following:
   ```terminal
   apply # just one word is sufficient
   skip # just one word is sufficient
   <modify_as_...> # explain the changes that you want to be made to the AI suggestion or make your own, alternative suggestion
   ```

3. When you have reviewed all the issues, manually review, commit, and push the changes in Git.
