<h1 align="center">AEC Pilot — MCP for Revit, AutoCAD, Civil 3D, Navisworks and more</h1>

<p align="center">
  Let your AI assistant read and edit the model that is open in your Autodesk app, in plain language.
</p>

<p align="center">
  <a href="https://www.aecpilot.com/mcp"><img alt="Website" src="https://img.shields.io/badge/website-aecpilot.com-021E45"></a>
  <img alt="Apps" src="https://img.shields.io/badge/Autodesk-8%20apps-021E45">
  <img alt="MCP Registry" src="https://img.shields.io/badge/MCP%20Registry-com.aecpilot%2Faec--pilot-5b9bf0">
  <img alt="License" src="https://img.shields.io/badge/license-commercial%20(14--day%20free%20trial)-informational">
</p>

---

**AEC Pilot** runs a local MCP server **inside** each Autodesk application on your
PC and gives your AI assistant **480+ actions** on the open model or drawing.
Claude, ChatGPT, Cursor or any other MCP client works on the live model instead of
only giving advice.

> This repository is the public overview. The server ships inside the AEC Pilot
> add-in. Full guide: **[aecpilot.com/mcp](https://www.aecpilot.com/mcp)**

## What it does

- **Revit**: select and edit elements and parameters, create sheets and views,
  tag, run clash checks, export IFC, drive Dynamo.
- **AutoCAD**: draw and modify geometry, layers, blocks, layouts, plot to PDF.
- **Civil 3D**: alignments, profiles, surfaces, corridors, pipe networks, sample
  lines and section views, COGO points.
- **Advance Steel**: read and edit the steel model.
- **Navisworks**: search sets, clash detection, TimeLiner 4D, quantification,
  viewpoints, append / merge / refresh / publish.
- **Inventor**: parts, sketches and features, assemblies, iLogic, drawings, BOM.
- **3ds Max**: scene objects, modifiers, materials, cameras and lights, rendering.
- **Robot Structural Analysis**: nodes, bars, supports, loads, analysis and results.

Every app also has an optional code tool (for example `execute_revit_code`) for
anything the fixed actions do not cover. You can switch it off in Settings.

## Works with your assistant

AEC Pilot speaks plain MCP, so any MCP client works. These are set up for you in
one click from **Settings → Setup Guide**:

| Client | Config |
|---|---|
| **Claude Desktop** | JSON |
| **Claude Code** | JSON |
| **ChatGPT / Codex** | TOML |
| **Cursor** | JSON |
| **Google Antigravity** | JSON |

Setup writes only to the clients you have installed, and **keeps the MCP servers
already in your config**.

Running more than one Autodesk app, or two copies of the same one? Each copy gets
its own server entry, so the assistant can tell them apart.

The assistant can also call `get_knowledge_template` for checked API notes and
step-by-step recipes for each app, instead of guessing.

## Privacy

- The server listens on **localhost only**. Your models and drawings stay on your
  machine.
- AEC Pilot does not send your model anywhere. Your AI client sends what it reads
  to your own AI provider, under your own account.
- Privacy policy: <https://www.aecpilot.com/privacy>

## Requirements

- Windows 10 / 11, 64-bit
- One or more of: **Revit 2023–2027**, **AutoCAD / Civil 3D 2021–2027**,
  **Advance Steel 2024–2027**, **Navisworks Manage / Simulate 2023–2027**,
  **Inventor 2027**, **3ds Max 2024–2027**, **Robot Structural Analysis 2024–2027**
- An MCP client (bring your own AI account)
- An **AEC Pilot licence**: free 14-day trial, no card
  ([pricing](https://www.aecpilot.com/pricing))

> No Node.js, no Python, no separate runtime. The local bridge is a single
> executable that ships with the add-in.

## Install

1. Download the installer from **[aecpilot.com/install](https://www.aecpilot.com/install)**.
   It finds your Autodesk apps and adds AEC Pilot only to the ones you choose.
2. Start the app, open the **AEC Pilot** tab, click **Activate** and paste the
   username and licence key from your account.
3. Open **Settings → Setup Guide**, pick your assistant and click the setup
   button. Restart the assistant so it loads the new server.

Step by step: **[Getting started](https://www.aecpilot.com/docs/getting-started)** ·
**[Connect your AI client](https://www.aecpilot.com/docs/connect)**

## Docs

- Getting started: <https://www.aecpilot.com/docs/getting-started>
- Connect an MCP client: <https://www.aecpilot.com/docs/connect>
- How to ask: <https://www.aecpilot.com/docs/how-to-ask>
- Troubleshooting: <https://www.aecpilot.com/docs/troubleshooting>
- What changed, release by release: <https://www.aecpilot.com/changelog>

## MCP guides per app

[Revit](https://www.aecpilot.com/revit-mcp) ·
[AutoCAD & Civil 3D](https://www.aecpilot.com/autocad-mcp) ·
[Civil 3D AI](https://www.aecpilot.com/civil-3d-ai) ·
[Advance Steel](https://www.aecpilot.com/advance-steel-mcp) ·
[Navisworks](https://www.aecpilot.com/navisworks-ai) ·
[Inventor](https://www.aecpilot.com/inventor-mcp) ·
[3ds Max](https://www.aecpilot.com/3ds-max-mcp) ·
[Robot](https://www.aecpilot.com/robot-mcp) ·
[Dynamo AI](https://www.aecpilot.com/dynamo-ai)

## More than MCP

The same licence includes the rest of the AEC Pilot suite: a built-in chat panel
in each app, plus add-ins for parameters, rebar, modelling, batch export and more.
See **[aecpilot.com/toolbox](https://www.aecpilot.com/toolbox)**.

## Questions

Issues here are welcome, but the fastest way to reach a person is
**[aecpilot.com/contact](https://www.aecpilot.com/contact)** or info@aecpilot.com.

## License

Commercial. AEC Pilot is licensed per seat per year (free 14-day trial). See
[LICENSE](LICENSE) and the [terms of service](https://www.aecpilot.com/terms-of-service).

---

<sub>AEC Pilot is made by 7Dimensions OÜ, Tallinn, Estonia. Revit, AutoCAD,
Civil 3D, Advance Steel, Navisworks, Inventor, 3ds Max and Robot Structural
Analysis are trademarks of Autodesk, Inc. AEC Pilot is not affiliated with,
endorsed by, or sponsored by Autodesk.</sub>
