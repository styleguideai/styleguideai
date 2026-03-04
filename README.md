### AI reviewer for technical writers

Prerequisites: You have locally installed Claude Code or Gemini CLI as whitelisted by your corporation.

**TIP:** Even better, use both Claude Code and Gemini CLI because based on a benchmark test (from February 2026) we found that the Gemini 3 model that Gemini CLI uses significantly outperforms Claude's models in catching style guide rule violations.

To start using AI for peer reviews, set it up as follows:

1. Clone this repository to your home directory:
   
   `$ git clone origin git@github.com:styleguideai/styleguideai.git`

3. Add permissions to the setup script:
   
   `$ chmod +x setup.sh`

5. Run the setup script:
   
   `$ bash setup.sh`
