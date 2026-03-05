Start every response with a line "AI review report".

End every response with a line "End of report".

Number the issues in the order in which you add them.

## Issue format

For each issue, use this format:

*   **Issue <number>**
    *   **File:** <filename of the file being reviewed>
    *   **Severity:** `violation` or `suggestion` (optional — include only when the distinction is clear-cut; `violation` = documented style rule broken, `suggestion` = stylistic preference or judgment call)
    *   **Current sentence:** `<sentence where the issue appears>`
    *   **Suggested change:** `<sentence updated to resolve the issue>` (do not emphasize the changes)
    *   **Style rule:** <first sentence of the style rule>
    *   **Source:** <where the rule comes from — format depends on review mode>
        *   PDF reviews: *Source Title* > *Chapter* > *Section* > *Subsection* (include all TOC levels)
        *   SSG reviews: SSG > *Rule heading* (e.g., SSG > Contractions)
        *   Vale reviews: Vale rule ID (e.g., Vale > RedHat.Passive)
        *   Mod docs reviews: Modular Docs > *Section heading*
        *   Quick reviews (grammar/spelling): omit this field

(Start the next issue after a blank line.)

## Multiple issues in the same sentence

When a sentence has more than one issue, group them together. On the first issue in the group, include all fields and add a warning line. On subsequent issues in the group, omit **File:** and **Current sentence:** (they are the same as the first issue):

*   **Issue <number>**
    *   **File:** <filename of the file being reviewed>
    *   **Current sentence:** `<sentence where the issues appear>`
    *   **Suggested change:** `<sentence updated to resolve this specific issue>` (do not emphasize the changes)
    *   **⚠** Multiple issues in this sentence — evaluate suggestions one by one.
    *   **Style rule:** <first sentence of the style rule>
    *   **Source:** <where the rule comes from>
*   **Issue <number>**
    *   **Suggested change:** `<sentence updated to resolve this specific issue>` (do not emphasize the changes)
    *   **⚠** Multiple issues in this sentence — evaluate suggestions one by one.
    *   **Style rule:** <first sentence of the style rule>
    *   **Source:** <where the rule comes from>

(Start the next issue after a blank line.)

## Product-specific formats

When a product-specific review guide in `product/` defines its own output format, follow that format instead of this one.

## Example

AI review report

*   **Issue 1**
    *   **File:** modules/proc_configuring-oidc.adoc
    *   **Severity:** `violation`
    *   **Current sentence:** `This feature allows you to configure OIDC authentication for your application.`
    *   **Suggested change:** `With this feature, you can configure OIDC authentication for your application.`
    *   **Style rule:** Do not use anthropomorphic language such as "allows", "lets", "helps", or "enables" when describing features.
    *   **Source:** *IBM Style* > *Language and grammar* > *Anthropomorphism*

*   **Issue 2**
    *   **File:** modules/proc_configuring-oidc.adoc
    *   **Current sentence:** `The client secret is set by the user and it can be changed at any time.`
    *   **Suggested change:** `You set the client secret, and you can change it at any time.`
    *   **⚠** Multiple issues in this sentence — evaluate suggestions one by one.
    *   **Style rule:** Use active voice instead of passive voice.
    *   **Source:** *IBM Style* > *Language and grammar* > *Active and passive voice*
*   **Issue 3**
    *   **Suggested change:** `You set the client secret and can change it at any time.`
    *   **⚠** Multiple issues in this sentence — evaluate suggestions one by one.
    *   **Style rule:** Do not use a comma before "and" in a compound predicate with two verbs sharing the same subject.
    *   **Source:** SSG > Comma usage

End of report
