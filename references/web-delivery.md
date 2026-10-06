# Web delivery and checks

## Font assets and CSS

Use the selected file's supported styles and weights. Register variable weight ranges in `@font-face`; regular and italic may be separate files. Prefer high-level properties for weight, style and supported standard behaviour. Use `font-variation-settings` for necessary custom axes, with the actual minimum/default/maximum values. A manually specified `opsz` should be intentional; `font-optical-sizing: auto` allows the font/browser to respond to size when supported. Reset obsolete axis settings when changing families.

Serve only required assets and provide a reasonable fallback. Select a `font-display` strategy consciously; `swap` keeps text available but can produce reflow. Compare fallback and loaded metrics, then consider `size-adjust` and metric overrides only with measured values. Do not invent offsets. Verify that fallbacks fit controls and headings when fonts fail.

Prefer relative text sizes and unitless line heights for ordinary UI/reading roles. Fluid type can use `clamp()` with relative minimum/maximum bounds; test enlargement rather than assuming a viewport-driven formula respects it. Avoid fixed heights and clipped overflow on text containers. Keep logical source order aligned with the reading sequence when CSS Grid changes placement. Use container/viewport changes to recombine spans; do not simulate responsiveness by transforming the whole specimen smaller.

## Accessibility checks are distinct from house style

WCAG 2.2 AA text contrast is at least 4.5:1 for ordinary text or 3:1 for large text (at least 18pt regular or 14pt bold, equivalent to 24 CSS px or about 18.67 CSS px). Evaluate actual effective foreground/background pairs. Compare unrounded ratios with thresholds. A single palette score misses muted text, captions and accent panels; a nominal pass can still look weak with thin strokes. Apply the criterion's actual exceptions rather than classifying all poster text as decoration. [W3C contrast guidance](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html)

Enlarge text to 200% without losing content/functionality. For ordinary vertically scrolling web content, check reflow at 320 CSS px wide, including the equivalent 400% browser zoom from a 1280px viewport; criterion exceptions exist for content requiring two-dimensional layout. A side-scrolling specimen canvas does not excuse inaccessible tool controls. [Resize text](https://www.w3.org/WAI/WCAG22/Understanding/resize-text.html), [Reflow](https://www.w3.org/WAI/WCAG22/Understanding/reflow.html)

Apply the following together as a user override and check for clipped, missing or overlapping content: line height 1.5× font size, following paragraph space 2×, letter spacing 0.12em, word spacing 0.16em. These are override tolerance values, **not required authored defaults**. Account for properties that do not apply to a language/script. [Text spacing](https://www.w3.org/WAI/WCAG22/Understanding/text-spacing.html)

These targeted checks do not certify full WCAG conformance. Keyboard operation, semantic structure and other applicable criteria still matter in the wider interface workflow.

## Small, representative verification set

- Inspect headline, several paragraphs, caption, label/control, and numbers at intended sizes.
- Test narrow and wide composition, a long unbroken token, a long heading and increased text length.
- For English/Swedish specimens, include `Å Ä Ö å ä ö`, punctuation and currencies; use the real required scripts for other projects.
- Check keyboard focus and editable/control text as well as the hero specimen.
- Block font loading or use a deliberate fallback; check layout before and after successful load.
- Exercise 200% text/zoom, 320px reflow, and the combined spacing override above.
- Record browser/width, measured pair and observed outcome. Do not report a planned test as completed.

Use the project's existing test/render tools. Choose a small number of representative states proportional to the change instead of building a second test framework.

## Sources for implementation details

[CSS Fonts Level 4](https://www.w3.org/TR/css-fonts-4/) is a working draft, not a promise of universal browser support. Check the relevant property and target browser when implementing advanced behaviour. [MDN's variable font guide](https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts) provides practical supported-axis examples. [CSS Grid Level 2](https://www.w3.org/TR/css-grid-2/) defines placement and alignment; preserve logical order when using them.
