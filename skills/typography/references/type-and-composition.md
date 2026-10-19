# Type and composition

## Start from the reading task

Set a real paragraph before selecting a spectacular headline. For an operating interface, the equivalent anchor is its repeated label/value/control text. Inspect the face at the smallest important role, not only enlarged in a picker. Check distinguishability (`I l 1`, `O 0`), punctuation, figures, accents, italics and the actual languages needed.

Use the supplied text where available. An English pangram does not prove Swedish coverage, an isolated headline does not prove sustained reading, and a book paragraph does not prove that tabular data is legible.

## Pairing is a division of labour

Try the existing or anchor family alone before adding faces. Compare candidates at visually comparable size: equal CSS sizes do not mean equal perceived size. Look at x-height, width, stroke modulation, aperture, terminals, stress and overall texture. These are observations to explain a relationship, not a compatibility formula.

Useful strategies include:

- **One family, differentiated roles:** contrast weight, size, case and spacing without adding a second voice.
- **Superfamily:** related serif/sans branches share underlying proportions while performing different tasks.
- **Distinct display and reading faces:** a characterful heading face gives short text presence; the reading face supports a steady paragraph rhythm.
- **Supporting mono or tabular figures:** distinguish code or align changing data when the content benefits; monospace is not required for all numbers.

A pair can share proportions and differ in construction, or deliberately emphasize a stronger difference. Explain its intended relationship and test it in the same composition. Two serifs can work; two sans serifs can work. Reject unhelpful competition or near-duplication on rendered evidence, not category rules. Avoid making every role expressive at once.

## Tune the reading triangle

Size, measure and leading constrain one another. For ordinary Latin-script web prose, around 45–75 characters per line and roughly 1.4–1.7 unitless leading are useful initial experiments, not pass/fail limits. A CSS `ch` is based on the zero glyph's advance, so `65ch` does not guarantee 65 actual characters. Inspect the real lines.

Longer measures usually benefit from additional leading. Short display text can often use tighter leading and tracking; check accented capitals, descenders and multiple lines before accepting it. A dense product label and a literary paragraph have different needs. Do not shrink essential copy simply to preserve a decorative composition.

Use spacing or indentation to mark paragraphs coherently. Space before and after headings should group the heading with its following content. Check the texture at paragraph scale: erratic word gaps, accidental rivers, isolated final words and awkward adjacent wraps. For web prose, ragged alignment is a dependable starting point; justification needs language-aware hyphenation and deliberate review.

Keep normal lowercase tracking near the face's intended spacing unless the specimen supports an adjustment. Tracking for capitals/small caps can differ. Do not replace kerning with manually inserted spaces. True small caps and tabular/oldstyle numerals require font support; use them where their role earns the additional setting.

## Build a grid from the content

Establish reading measure and content groups before choosing a column count. A narrow reading column may span several underlying grid columns. Supporting notes can occupy a separate span without forcing the main text wider.

Use margins to define the field, gutters to distinguish adjacent streams, and shared edges to make relationships visible. Asymmetry becomes coherent when headline, body, caption and negative space share a few intentional alignments. Avoid treating every column as a box that must be filled.

For an editorial page, try a broad heading above a narrower body with a marginal caption or pull quote. For a poster, change scale and spans decisively while retaining a clear entry and reading sequence. For a product interface, prioritize predictable labels, values and interaction groups. These are starting compositions, not mandatory templates.

A baseline grid is useful for coordinating line rhythms in controlled layouts. In responsive HTML, a repeated background line is only a guide: font metrics, varying line heights and content flow determine actual baselines. Do not claim snapping because an overlay exists. Recompose at small widths instead of scaling a desktop page into illegibility.

### Advanced composition

Distinguish the page or viewport format from the textblock inside it. Tune their proportions and the four margins together; a generous outer margin can carry notes without widening the reading measure. Root-two, simple fractional and historic page ratios can provide starting studies, but no ratio guarantees harmony. On a flowing screen, let content determine height when a fixed format would clip or distort the reading experience.

Choose a manuscript grid for sustained prose, column grids for related vertical streams, modular grids for coordination in both directions, or hierarchical arrangements when unequal zones express content priorities. These are working approaches, not mutually exclusive laws. A narrow reading block may span several underlying columns; unequal tracks and reserved empty zones can make the hierarchy clearer.

Separate columns, rows, gutters, flowlines, zones and recurring markers. Flowlines align the edges of content bands; text baselines align glyphs within lines. Define actual placement and spans when delivering a layout system, not merely a guide overlay. Link spacing to leading where it improves rhythm, while retaining optical exceptions for different fonts and sizes.

For responsive systems, specify which alignments, spans and margins persist and which recompose. Preserve a meaningful source reading order, including quotations and marginal notes. Nested groups can share parent grid lines. Moving a box does not thread prose into another box: text flow, overflow and pagination need their own explicit behavior and verification.

## Colour and optical judgment

Typography has a visual density produced by weight, size, spacing and the surface beneath it. Compare light and dark specimens before adjusting a face; extra weight or tracking may help some combinations but is not a universal dark-mode recipe. Colour should reinforce roles and hierarchy without becoming the only distinguishing cue.

Use measurable contrast to identify visibility problems and optical review to assess hairlines, density and hierarchy. Keep these two kinds of evidence separate. Historic canons are useful precedents; they do not demonstrate that one ratio is universally harmonious.

## Compare one adjustment at a time

When comparing variants, hold the content, viewing conditions and settings outside the chosen adjustment steady while changing one relationship: for example, placement, display tracking or palette. Review the complete composition again after inspecting the local difference; a local improvement can change the whole reading path. Record the intended effect in a sentence when useful. This is a judgment aid, not a winner score or a harmony formula.

When an observed optical problem needs correction, choose the smallest useful scope—system, role or block—that addresses the observed problem. Keep role inheritance as the default, record why an exception exists, and provide a clear return to the role setting. Start with whole-block leading or tracking for display text; defer line-by-line spacing, manual kerning and hanging punctuation unless the medium and the composition genuinely require them. Preserve the authored wording and recheck the result at the other relevant widths or outputs.

## Judge the medium before the adjustment

Name the output format before evaluating composition, because the same relationship behaves differently across media:

- **Responsive web:** test actual viewport widths and content growth. Let reading order, measure, spans and margins recompose; a scaled desktop view is not evidence of a usable narrow layout.
- **Fixed page or spread:** judge the page and, where relevant, the facing pair as a bounded field. Inspect margins, page-to-page continuity, folios and the intended crop or bleed separately from flowing text behavior; do not transfer spread-specific effects into web rules.
- **Fixed social frames:** inspect each frame at its authored export dimensions, including edge clearance, hierarchy and sequence across frames. Treat the frame as fixed for this judgment and avoid assuming any platform-specific display or crop behavior.

These are output-specific review conditions, not promises of pagination, platform integration or a particular export feature.
