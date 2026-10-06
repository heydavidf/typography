---
name: typography
license: MIT
description: Choose and refine typefaces, hierarchy, spacing, and grids for design work. Use for font pairing, typography systems, editorial or interface typesetting, and typography audits; preserve established brand choices. Does not replace a full product-design workflow or create custom font files.
---

# Typography

Make content easier to read, navigate, and feel through purposeful type and space. Work inside the requested medium and established identity. A typographic refinement need not become a rebrand.

## Ground the decision

Read the project's design authority, actual content, fonts and existing styles before proposing replacements. Establish the dominant task: sustained reading, quick scanning/operation, or expressive display. Mixed surfaces need different roles, not a compromise setting everywhere.

Identify the audience, language/scripts, available widths, density, platform, font assets and licence constraints from the workspace. Ask only about consequential choices that remain unknown. For existing work, distinguish intentional brand decisions from accidental implementation drift.

## Shape the system

For new work, choose a reliable reading/operating face first, then determine whether another face improves a specific role. A single family or coordinated superfamily is a complete option. For refinement, improve the existing families' use before considering replacements.

Read [Type and composition](references/type-and-composition.md) when choosing faces, tuning a hierarchy or constructing a grid. Compare actual paragraphs, headings, labels and numbers at their intended sizes. Explain the useful difference between faces through role, construction, proportion, rhythm and tone; a serif/sans label alone does not establish harmony. Do not invent an objective aesthetic score.

Tune size, measure and leading together. Use a scale to organize roles, then adjust optically for the face and content. Coordinate the text with margins, gutters and spans. A grid should accommodate content and priorities; its empty areas are active parts of the composition. Expressive work can break alignment deliberately while retaining a clear reading path.

Historical print ratios and conventional numeric ranges are starting points. Do not turn them into accessibility requirements or enforce them on unrelated scripts, dense data, posters or user text settings. Preserve authorial copy; solve bad wraps through composition before rewriting it.

## Implement and verify

For web work, read [Web delivery and checks](references/web-delivery.md). Use the actual font assets, supported styles and axes; do not silently substitute a synthetic face and call it the designed result. Preserve semantic reading order as visual spans change.

Review a representative rendered specimen at wide and narrow widths, including long headings, multiple paragraphs, captions and relevant characters. Inspect font failure/fallback, enlargement and text-spacing overrides. In interfaces, include controls, numerical data and error states. For a print-ready PDF or document, use the relevant PDF/document production workflow and inspect an intended-size proof; a screen specimen alone is not a print proof.

Separate observed defects, measured checks and aesthetic judgments. Report what was actually rendered or tested, and any review still outstanding. Label evidence precisely: document-width measurement, visual screenshot review, root-font-size probe, and real browser zoom are different checks. A contrast pass or clean stylesheet does not prove that the typography works.

## Deliver the useful artifact

Match the user's request: a focused critique, implemented refinement, or reusable system. Prefer concrete before/after decisions with reasons over an inventory of typography terms. For a system, record:

- Roles and exact family, style/weight, size, leading, tracking and useful OpenType settings.
- Measure, margins, gutters, columns/spans and responsive changes.
- Text/surface colours, checked pairs and any unresolved accessibility defects.
- Font source, required assets, supported axes, fallbacks and licensing/dependency notes.
- Rationale, deliberate exceptions and evidence of verification.

Extend the owning `DESIGN.md` and tokens rather than creating a competing authority. Use its existing format; when a specific external specification is required, verify that specification. Counterform is an optional local specimen/export companion, not a prerequisite. Its curated combinations express design judgments, not guarantees.

For citations or deeper rationale, read [Sources and interpretation](references/sources.md). It attributes the influences and distinguishes design interpretation from current implementation guidance; do not claim the books were reviewed cover to cover.
