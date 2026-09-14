# HDI_DISTINCT_ATTRIBUTES

A 4D **HDI** (How Do I) example demonstrating how to retrieve the **distinct attribute paths** and **distinct attribute values** of an Object field across a selection of records — originally distributed as a binary `.4DB` database for 4D v16, converted to a modern 4D project (`.4DProject`), and modernized for current 4D language conventions.

## What This Demonstrates

The `CONTACTS_2` table stores per-record, schema-free metadata in an Object field (`Info`) — e.g. `Gender`, `Age`, `Birthday`, `Company`, arbitrary custom attributes added per contact. Because the field's shape can vary from record to record, you can't just list its "columns" the way you would with regular table fields. This example shows how to:

- Enumerate every attribute path that actually occurs in the field across the current selection, with `DISTINCT ATTRIBUTE PATHS`.
- For a chosen attribute path, enumerate every distinct value that occurs for it, with `DISTINCT ATTRIBUTE VALUES` — including type-aware handling for boolean, numeric, and string-valued attributes.
- Use a selected (path, value) pair to filter the table with `QUERY BY ATTRIBUTE`.
- Add, edit, and remove ad hoc attributes on an individual record's Object field at runtime (the `addInfo` dialog).
- Compute simple aggregate statistics (`Min`, `Max`, `Average`, record count) over an Object-field attribute.

## Project Structure

| Path | Purpose |
|------|---------|
| `Project/Sources/Methods/00_Start.4dm` | Application entry point; opens the splash window (or brings it to front if already open) |
| `Project/Sources/Forms/HDI` | Splash screen (title, version check, entry point to the demo) |
| `Project/Sources/Forms/HDI2` | Main demo form — three pages: Info, distinct-paths/values example, and a contacts list with stats |
| `Project/Sources/Forms/addInfo` | Modal dialog for adding/editing/removing an attribute on a contact's Object field |
| `Project/Sources/Methods/updateStat.4dm`, `hdi_init.4dm` | Helper/subroutine methods (not standalone-runnable; see Points of Interest below) |
| `Resources/*.lproj` | XLIFF localisation resources (English source language + Japanese) |
| `Project/Sources/styleSheets*.css` | Form CSS: dark-mode colors and macOS Liquid Glass button sizing |

## Points of Interest

This project has been brought up to current 4D conventions (4D 21.1, `compatibilityVersion: 2101`). Notable changes from the original binary conversion:

- **Localisation** — every user-facing string (menu titles, form labels, alerts, `Request` prompts) is externalised to XLIFF (`Resources/{lang}.lproj/*.xlf`), grouped by purpose (menu, per-form, messages) rather than one monolithic file.
- **Modern variable declarations** — legacy `C_LONGINT`/`C_TEXT`/`C_OBJECT`/etc. directives replaced project-wide with `var`/`#DECLARE`, including the compiler declaration files (`Compiler_Variables.4dm`, `Compiler_Arrays.4dm`).
- **Standard menu actions** — the `Quit` menu item uses 4D's built-in `"action": "quit"` instead of a one-line method wrapper, so it gets correct platform integration (e.g. macOS Application menu placement) and automatic enable/disable.
- **Method visibility** — subroutines and form-dependent helper methods are marked `invisible` so only real entry points appear in the Run > Method... dialog.
- **Non-blocking dialog / window-reuse startup pattern** — `00_Start` uses `CALL WORKER` and non-blocking `DIALOG(...; *)` instead of spawning a dedicated process, and detects/re-focuses an already-open splash window instead of opening a duplicate. State that used to live in interprocess variables (e.g. whether to quit) now lives on the form (`Form.quit`).
- **Dark mode & Liquid Glass** — form text/backgrounds use 4D's `"automatic"`/`"automaticAlternate"` color values so they adapt to the OS color scheme, and buttons are sized per `form-theme` (`liquid-glass` vs `mac-classic`) via CSS media queries rather than fixed pixel heights.
- **Listbox display defaults** — all listbox columns use `truncateMode: none` (no ellipsis truncation) and all listboxes use `resizingMode: legacy` (only the last column grows on resize).

These conventions are documented in more detail under [`.github/instructions/`](.github/instructions/), and apply uniformly across the modernized HDI example repositories.

## Requirements

- 4D 21.1 or later (project uses `compatibilityVersion: 2101`).
- No external dependencies; the `CONTACTS_2` table and its sample data are included with the project.

## Origin

This project started as a binary `.4DB` example database originally distributed with 4D v16. It was converted to the modern project architecture (`.4DProject`) using 4D 21's built-in binary-to-project conversion tool, then modernized with the help of GitHub Copilot.

- **Blog post:** https://blog.4d.com/go-further-with-object-fields/
- **Original download:** https://download.4d.com/Demos/4D_v16/HDI_DISTINCT_ATTRIBUTES.zip

## References

- `DISTINCT ATTRIBUTE PATHS`: https://developer.4d.com/docs/commands/distinct-attribute-paths
- `DISTINCT ATTRIBUTE VALUES`: https://developer.4d.com/docs/commands/distinct-attribute-values
- `QUERY BY ATTRIBUTE`: https://developer.4d.com/docs/commands/query-by-attribute
- Object (field) type: https://developer.4d.com/docs/Concepts/dt_object
- 4D CSS stylesheets: https://developer.4d.com/docs/FormEditor/stylesheets
