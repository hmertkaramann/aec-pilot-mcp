---
name: aec-pilot
description: Work on a model or drawing that is open in an Autodesk app through AEC Pilot. Use when the user asks to read, check, change, document or export something in Revit, AutoCAD, Civil 3D, Advance Steel, Navisworks, Inventor, Fusion, 3ds Max or Robot Structural Analysis, or when AEC Pilot tools (list_revit_instances, get_model_context, execute_revit_code and similar) are available.
---

# Working in Autodesk apps with AEC Pilot

AEC Pilot runs inside each Autodesk app on the user's PC. Its tools act on the
model or drawing that is open right now, so every change is real and lands in
the user's file. Work the way a careful colleague at the user's desk would.

## 1. Find the right app and file first

1. Call the app's instance tool before anything else: `list_revit_instances`,
   `list_autocad_instances`, `list_navisworks_instances`,
   `list_inventor_instances`, `list_fusion_instances`, `list_3dsmax_instances`
   or `list_robot_instances`. It shows whether the app is connected and which
   file is open.
2. If the user has two copies of an app open, say which file you are about to
   work on and ask before changing anything.
3. Call `get_model_context` before the first real step. In Civil 3D also call
   `get_civil_context`; in Advance Steel also call `get_steel_model_summary`.
   Use what they return (units, levels, layers, styles, phases, active view)
   instead of guessing.

If an instance tool answers that nothing is connected, tell the user what to
check, in this order: the Autodesk app is open with a file loaded; the AEC Pilot
tab is there and its connector is on; AEC Pilot is activated (trial or licence).
Do not retry the same call in a loop.

## 2. Prefer the fixed tools

- Each app has ready tools for common work (parameters, sheets, views, tags,
  layers, blocks, alignments, surfaces, clash tests, BOMs and more). They check
  their inputs and report clear errors. Use them first.
- For a step-by-step recipe or checked API notes, call `get_knowledge_template`
  for that app before writing anything yourself.
- Use the code tool (`execute_revit_code`, `execute_autocad_code`,
  `execute_civil_code`, `execute_navisworks_code`, `execute_inventor_code`,
  `execute_fusion_code`, `execute_maxscript`, `execute_robot_code`) only when no
  fixed tool covers the job. Read first, change second, and keep each script
  small enough to check its result.
- If the user will repeat a job, offer to keep the working script as a tool of
  its own with `save_custom_tool`.

## 3. Changes the user must agree to

Say what will change and ask before you:

- delete or purge elements, families, layers, blocks, views or sheets;
- change many elements at once (bulk parameter edits, renumbering, restyling);
- save, save as, close a file, or overwrite an export;
- run anything that cannot be undone in the app.

After a change, read the result back (a count, a parameter value, a screenshot
tool where the app has one) and report what actually happened, including what
failed. Never report success you did not check.

## 4. Units and numbers

- Use the units that `get_model_context` reports, and say the unit in every
  answer that has a number.
- Fusion tools take and return millimetres.
- Inventor lengths go in as strings with units (for example "25 mm"); numbers
  that come back are in database units with a `display` value in the document's
  units.
- Round only in the answer, never in the values you send back to a tool.

## 5. Large models

- Ask for counts or a filtered list before asking for every element.
- Work one level, view, sheet or selection set at a time when a model is large,
  and tell the user how far you got if you stop early.

## 6. When something fails

Read the error the tool returns. Most say what was wrong (a missing parameter,
a read-only value, a view type that does not allow the change). Fix the input
and try once more, or explain the problem to the user in plain words with the
next step they can take. Do not hide a failed step inside a long answer.

More help for the user: https://www.aecpilot.com/docs/how-to-ask and
https://www.aecpilot.com/docs/troubleshooting
