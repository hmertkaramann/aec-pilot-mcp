# AEC Pilot for Claude

![AEC Pilot](logo.png)

Let Claude read and edit the model that is open in your Autodesk app, in plain
language. AEC Pilot works inside **Revit, AutoCAD, Civil 3D, Advance Steel,
Navisworks, Inventor, Fusion, 3ds Max and Robot Structural Analysis** and gives
Claude 550+ actions on the live model: parameters, sheets and views, tags, clash
tests, alignments and surfaces, layers and blocks, quantities, analysis results
and more.

This plugin adds two things to Claude:

- **Seven MCP servers**, one per Autodesk app family, that connect Claude to the
  AEC Pilot add-in on your PC.
- **A skill** that tells Claude how to work safely in a live model: find the
  open file first, use the checked tools before writing code, ask before
  deleting or saving, and report only results it has checked.

## Requirements

- Windows 10 or 11, 64-bit.
- **AEC Pilot installed** from [aecpilot.com/install](https://www.aecpilot.com/install)
  and activated in your Autodesk app. A free 14-day trial needs no card; after
  that AEC Pilot is a paid licence per seat
  ([pricing](https://www.aecpilot.com/pricing)).
- One or more supported Autodesk apps:
  [full list of versions](https://www.aecpilot.com/docs/getting-started).
- The MCP servers run where Claude can start programs on your PC: **Claude
  Code** and **Cowork** sessions on your computer. In chat on claude.ai the
  skill loads, but local servers do not start. In the Claude desktop app's chat,
  connect AEC Pilot with **Settings → Setup Guide** in the add-in instead.

## Install

In Claude Code:

```
/plugin install aec-pilot --marketplace hmertkaramann/aec-pilot-mcp
```

In the Claude desktop app, add it from **Customize → Plugins**.

## Use it

1. Open your Autodesk app with a model or drawing, and make sure the AEC Pilot
   tab shows the connector as on.
2. Ask Claude what you need, for example:
   - "List the sheets in this Revit model that have no views on them."
   - "In Civil 3D, sample the existing ground surface every 20 m along the
     main alignment and give me a table."
   - "Run the clash tests in Navisworks and group the new clashes by level."
3. Claude finds the open file, reads its context and works through the AEC
   Pilot tools. It asks before it deletes, saves or changes many elements at
   once.

Only one copy of each app is served by this plugin. If you work with two copies
of the same app at once, use **Settings → Setup Guide** in the add-in, which
adds a server for each copy.

If you already connected Claude Code with the Setup Guide, you will see the
same tools twice. Keep one of the two: disable this plugin's servers or remove
the Setup Guide entries.

## How it works

Each server entry in `.mcp.json` runs `server/start.ps1` with Windows
PowerShell. The script contains no server code. It looks for
`aec-mcp-bridge.exe` in the folders the AEC Pilot installer uses
(`Program Files\7Dimensions\AEC Pilot` and the AEC Pilot bundles under
`Autodesk\ApplicationPlugins` in Program Files and ProgramData) and runs it.
The bridge talks MCP with Claude over standard input and output, and forwards
each call to the AEC Pilot add-in inside the Autodesk app on `localhost`.

PowerShell is started with `-ExecutionPolicy Bypass` for this one script only,
so it also runs on PCs where the default policy blocks unsigned scripts. It does
not change any policy setting. If AEC Pilot is not installed, the script prints
a short message and exits. It downloads nothing and changes nothing on your PC.

## Privacy

- **Your models stay on your PC.** The AEC Pilot servers listen on `localhost`
  only. The plugin and the bridge do not upload your models, drawings or files.
- **What Claude reads goes to Anthropic.** Tool results that Claude reads (for
  example element names, parameter values or a table you asked for) become part
  of your conversation and are handled by Anthropic under your Claude account
  and Anthropic's terms.
- **What AEC Pilot sends to us (7Dimensions OÜ):**
  - **Licence checks**: licence key and username, trial or expiry status, a
    machine name and identifier (hashed hardware IDs, not the IDs themselves),
    add-in version and Autodesk product and release.
  - **Usage statistics**, on by default: which tools and commands ran, how often,
    how long they took and whether they succeeded, error codes, counts, the AI
    client and model, language and model size ranges. They never contain your
    models, drawings, file or project names, prompts, AI replies or file
    contents. Turn them off in Pilot Chat **Settings → Privacy**; IT
    administrators can turn them off for every user.
- **Retention**: usage statistics are kept as daily totals for 90 days, then as
  monthly totals, and deleted after 24 months. Account and licence data are kept
  while the account is active.
- **Third parties**: Cloudflare relays licence checks and usage statistics;
  Odoo S.A. hosts accounts, licences and orders. For users in Italy, San Marino
  and Vatican City, our distributor SOFiSTiK Italia S.r.l. receives trial
  details. We do not sell personal data.
- **Contact**: info@aecpilot.com

Full privacy policy: <https://www.aecpilot.com/privacy>

## Support

- Connect and troubleshoot: <https://www.aecpilot.com/docs/connect> and
  <https://www.aecpilot.com/docs/troubleshooting>
- Contact a person: <https://www.aecpilot.com/contact> or info@aecpilot.com

## License

The plugin files are free to use with AEC Pilot. AEC Pilot itself is
commercial software licensed per seat, with a free 14-day trial. See
[LICENSE](LICENSE) and the
[terms of service](https://www.aecpilot.com/terms-of-service).

AEC Pilot is made by 7Dimensions OÜ, Tallinn, Estonia. Revit, AutoCAD, Civil
3D, Advance Steel, Navisworks, Inventor, Fusion, 3ds Max and Robot Structural
Analysis are trademarks of Autodesk, Inc. AEC Pilot is not affiliated with,
endorsed by, or sponsored by Autodesk.
