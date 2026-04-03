```markdown
# Design System Strategy: The Curated Sanctuary

## 1. Overview & Creative North Star
The creative North Star for this design system is **"The Digital Concierge."** In the world of high-end property management, luxury is defined by what is absent: clutter, noise, and friction. 

This system rejects the "app-like" density of traditional management tools in favor of an **Editorial Layout** approach. We achieve a premium feel through intentional asymmetry—placing high-contrast typography against expansive white space—and "The Layering Principle." Instead of boxes and borders, we treat the UI as a series of fine paper sheets and frosted glass, creating a sense of architectural depth and quiet authority.

## 2. Colors & Surface Philosophy
The palette is rooted in a deep, scholarly Dark Red and a restrained Gold accent, set against a "Gallery White" foundation.

### The "No-Line" Rule
**Strict Mandate:** Designers are prohibited from using 1px solid borders to section content. Boundaries must be defined solely through background color shifts or tonal transitions. 
- Use `surface-container-low` (#f4f3f2) for large section backgrounds.
- Use `surface` (#faf9f8) for the main page body.
- Separation is achieved through the `Spacing Scale` (e.g., a `12` or `16` unit gap) rather than a line.

### Surface Hierarchy & Nesting
Treat the UI as a physical stack. To define importance, nest containers using the following logic:
1.  **Base Layer:** `surface` (#faf9f8)
2.  **Section Layer:** `surface-container-low` (#f4f3f2)
3.  **Actionable Card:** `surface-container-lowest` (#ffffff) 
*Result: A white card on a soft grey-white background creates a natural, "soft-lift" without aggressive shadows.*

### The "Glass & Gradient" Rule
To avoid a flat, "templated" look, primary CTAs and Hero sections should utilize a **Signature Texture**.
- **CTAs:** Instead of a flat hex, use a linear gradient: `primary-container` (#7a0c14) to `primary` (#550007) at a 135-degree angle.
- **Overlays:** Use `surface-blur` effects (Backdrop Blur: 20px) with 80% opacity on `surface-container-lowest` to create a "frosted glass" navigation bar or modal.

## 3. Typography
The system uses a dual-typeface pairing to balance modern precision with editorial elegance.

*   **Display & Headlines (Manrope):** High-end and geometric. Use `display-lg` for welcome screens and `headline-md` for property titles. The tracking should be tightened slightly (-2%) for headlines to feel "locked-in" and custom.
*   **Body & Labels (Plus Jakarta Sans):** Highly legible with a modern humanist touch. This handles the "utility" of the app—lease details, maintenance requests, and community updates.
*   **The Gold Accent:** Use `secondary` (#785924) exclusively for `label-md` or `title-sm` when highlighting a "Premium" status or a "Verified" badge. Never use Gold for long-form body text.

## 4. Elevation & Depth
We move away from Material Design’s traditional "floating" shadows toward **Tonal Layering**.

*   **Ambient Shadows:** If a card requires a shadow (e.g., a floating property preview), use an extra-diffused shadow: `Y: 20px, Blur: 40px, Color: rgba(26, 28, 28, 0.04)`. This mimics soft gallery lighting.
*   **The "Ghost Border" Fallback:** If accessibility requires a container edge (e.g., high-sunlight outdoor use), use the `outline-variant` (#dfbfbc) at **15% opacity**. It should be felt, not seen.
*   **Interaction Depth:** On press/active states, instead of "lifting" the card with a shadow, "sink" it by switching the background from `surface-container-lowest` to `surface-container-high`.

## 5. Components

### Buttons
*   **Primary:** Dark Red Gradient (`primary-container` to `primary`). 
    *   *Shape:* `md` (0.375rem) roundedness. 
    *   *Typography:* `title-sm` in `on-primary` (#ffffff).
*   **Secondary:** Ghost style. No background. `outline-variant` at 20% opacity.
*   **Tertiary:** Text-only using `primary-container` color, used for "View All" or "Cancel."

### Input Fields
*   **The Layout:** Abandon the "boxed" input. Use a `surface-container-low` background with a bottom-only `outline` (#8c716f) at 30% opacity. 
*   **States:** On focus, the bottom border transitions to `secondary` (Gold) and the label shifts to `primary`.

### Cards & Property Lists
*   **Forbid Dividers:** Do not use lines between list items. Use a `spacing-4` (1.4rem) vertical gap.
*   **The Hero Card:** Use `surface-container-lowest` with a `xl` (0.75rem) corner radius. Imagery should be desaturated by 5% to maintain the "Sophisticated" brand feel.

### Specialized Components
*   **Concierge Selection Chips:** Use `secondary-container` (#ffd393) with `on-secondary-container` (#795a25) text for high-end service requests (e.g., "Valet," "Spa").
*   **Status Indicators:** Use a subtle `secondary_fixed_dim` dot next to text rather than a bright green "Online" pill. Luxury communicates through whispers, not shouts.

## 6. Do’s and Don’ts

### Do
*   **Do** use asymmetrical margins. For example, a `24` unit left margin and a `16` unit right margin on a header can create a bespoke, editorial feel.
*   **Do** use `display-lg` typography for numbers (e.g., Rent amount, Floor number) to treat data as art.
*   **Do** prioritize "white space" as a functional element. If a screen feels "full," remove a decorative element, don't shrink the text.

### Don't
*   **Don't** use pure black (#000000). Use `on-surface` (#1a1c1c) to keep the contrast soft and expensive.
*   **Don't** use standard "Success Green" or "Warning Orange" for status unless absolutely critical for safety. Use tonal variations of `secondary` or `outline` to maintain the color story.
*   **Don't** use sharp 90-degree corners. Even the "none" setting should be avoided; stick to `DEFAULT` (0.25rem) as the minimum to keep the interface approachable.```