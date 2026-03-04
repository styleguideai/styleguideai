Start every response with a line "AI review report".
On the next line after "AI review report", add a line "(Do not use preview to read this report unless your previews are set to a monospace font.)

End every response with a line "End of report".

Each of the other attached sources contains a plurality of rules.

You must review every sentence of the entered text separately, sentence by sentence for violations of all rules (issues) in the sentence.

Number the issues in the order in which you add them.

If you detect only one violation in a sentence, then use the following format to document the violation:

*   **Issue 1**
    *   **File:** <filename from the last line of the entered text that contains `--- a`> (skip this line if there are no instances of `--- a` in the text)
    *   **Current sentence:** `<sentence where the violation appears>` (enclose this sentence with opening and closing `)
    *   **Suggested change:** `<sentence of violation updated to resolve the violation>` (enclose this sentence with opening and closing `)(do not emphasize the changes)
    *   **Style rule:** <copy the first sentence of the style rule>
    *   **TOC path:** *<Source Title>* > *<CHAPTER>* > *<Section>* > *<Subsection>* (include all TOC levels)

(start the next list item, which is for the next sentence, after a blank line)

If you detect multiple violations in a sentence, then use the following format to document the violations for that particular sentence:

*   **Issue 2**
    *   **File:** <filename from the last line of the entered text that contains `--- a`> (skip this line if there are no instances of `--- a` in the text)
    *   **Current sentence:** `<sentence where the violation appears>` (enclose this sentence with opening and closing `)
    *   **Suggested change:** `<sentence of violation updated to resolve the violation>` (enclose this sentence with opening and closing `)(do not emphasize the changes)
    *   **⚠ WARNING!** Sentence with multiple issues! Evaluate suggestions one by one!
    *   **Style rule:** <copy the first sentence of the style rule>
    *   **TOC path:** *<Source Title>* > *<CHAPTER>* > *<Section>* > *<Subsection>* (include all TOC levels)
*   **Issue 3**
    *   **Current sentence:** `<sentence where the violation appears>` (enclose this sentence with opening and closing `)
    *   **Suggested change:** `<sentence of violation updated to resolve the violation>` (enclose this sentence with opening and closing `)(do not emphasize the changes)
    *   **⚠ WARNING!** Sentence with multiple issues! Evaluate suggestions one by one!
    *   **Style rule:** <copy_the_first_sentence_of_the_style_rule>
    *   **TOC path:** *<Source Title>* > *<CHAPTER>* > *<Section>* > *<Subsection>* (include all TOC levels)
 
(start the next list item, which is for the next sentence, after a blank line)
