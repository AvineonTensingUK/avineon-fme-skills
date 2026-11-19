# Avineon FME MCP server and agent skills

A free, public, read-only [Model Context Protocol](https://modelcontextprotocol.io) (MCP) server for FME, and five open-source agent skills that use it. The server gives AI assistants and agents current answers about FME transformers, Safe Software's FME documentation, FME licensing, FME Flow Hosted costs and FME training, with a link to the source for every answer. The skills give an assistant the method: what to ask, which tools to call and in what order, and what not to claim.

```
https://agents.avineon.solutions/mcp
```

Streamable HTTP, no sign-in, no API key. The server is hosted by Avineon; this repository holds the agent skills, a Claude Code plugin, a stdio bridge for clients that need one, and the listing files for MCP directories. Set-up guides, example prompts and an FAQ are at [agents.avineon.solutions](https://agents.avineon.solutions/).

## What it can answer

| Area | Tools |
|---|---|
| **FME transformers** | `search_fme_transformers`, `get_transformer_details` (description, documentation link, how widely it is used, what usually comes before and after it), `find_transformers_for_task` (transformers, formats and typical chains for a task in plain language), `list_transformer_categories` |
| **FME documentation** | `search_fme_docs`: Safe Software's documentation pages (transformers, readers and writers, FME Form, FME Flow, FME Flow Hosted, REST API), support articles, FME Community posts, webinars and FME Hub items, as titles, links and short excerpts |
| **FME licensing and costs** | `recommend_fme_licence` (FME Form, FME Flow or FME Flow Hosted for a described use), `get_fme_licensing_overview`, `estimate_fme_flow_hosted_cost` (annual plan versus pay-as-you-go from Safe Software's published prices, with the break-even point) |
| **FME training and events** | `find_fme_training` (level, duration, price, dates and booking links), `list_events` |
| **Esri ArcGIS** | `get_arcgis_online_backup_manager`, `estimate_arcgis_online_backup_cost` |
| **Avineon** | `get_company_overview`, `list_services`, `search_site`, `get_page`, `search_case_studies`, `get_contact_info`, in English, Dutch, Flemish and French |

Example questions:

- Which FME transformers do I need to read a CSV of addresses, geocode them and load the points into PostGIS?
- What does the FeatureMerger do, and which transformers are usually used with it?
- Find Safe Software's documentation on scheduling a workspace in FME Flow.
- Two analysts convert CAD drawings to GIS every week and want it to run overnight, but we have no servers. Which FME licences do we need?
- What would a Professional FME Flow Hosted instance running 200 hours a month cost?

More: [agents.avineon.solutions/prompts](https://agents.avineon.solutions/prompts)

## Connect

**Claude, ChatGPT, VS Code, Cursor, Gemini CLI and others:** add the URL above as a remote MCP server. Step-by-step instructions for each client: [agents.avineon.solutions/install](https://agents.avineon.solutions/install).

**Claude Code:**

```bash
claude mcp add --transport http avineon https://agents.avineon.solutions/mcp
```

**Any client, as JSON:**

```json
{
  "mcpServers": {
    "avineon": { "type": "http", "url": "https://agents.avineon.solutions/mcp" }
  }
}
```

**Clients that only start local (stdio) servers:** use the bridge [mcp-remote](https://www.npmjs.com/package/mcp-remote), directly or with the [Dockerfile](Dockerfile) in this repository:

```json
{
  "mcpServers": {
    "avineon": { "command": "npx", "args": ["-y", "mcp-remote@0.16.1", "https://agents.avineon.solutions/mcp", "--transport", "http-only"] }
  }
}
```

**From an FME workspace:** the MCPCaller transformer (FME 2026.1 or later) can call the server with its URL and no credentials.

## Agent skills

The skills follow the open [Agent Skills](https://agentskills.io/specification) format, so they work in any client that supports it, including clients that ignore MCP prompts. Each skill tells the assistant to use the server for facts rather than answer from memory.

| Skill | What it does |
|---|---|
| [`plan-fme-workspace`](skills/plan-fme-workspace/SKILL.md) | Readers, writers and the transformer chain for a data task, with documentation links; flags deprecated transformers. It plans a workspace; it does not build or run one |
| [`choose-fme-licence`](skills/choose-fme-licence/SKILL.md) | FME Form, FME Flow or FME Flow Hosted for a described use, with the assumptions and the quote or trial route for your country |
| [`plan-fme-training`](skills/plan-fme-training/SKILL.md) | A course path for your level and goal, with dates, prices and booking links |
| [`estimate-fme-flow-hosted`](skills/estimate-fme-flow-hosted/SKILL.md) | Annual plan versus pay-as-you-go and the break-even point, from Safe Software's published prices |
| [`expose-fme-workspace-as-mcp-tool`](skills/expose-fme-workspace-as-mcp-tool/SKILL.md) | Publishing FME workspaces as tools on an FME Flow MCP server, and calling MCP servers from FME with the MCPCaller, summarised from Safe Software's documentation with links |

Add them with the [skills](https://github.com/vercel-labs/skills) command-line tool:

```bash
npx skills add AvineonTensingUK/avineon-fme-skills                            # all skills
npx skills add AvineonTensingUK/avineon-fme-skills --list                     # list them first
npx skills add AvineonTensingUK/avineon-fme-skills --skill plan-fme-workspace # one skill
```

**Claude Code:** this repository is also a plugin marketplace. The plugin installs the skills and connects the server in one step:

```bash
claude plugin marketplace add AvineonTensingUK/avineon-fme-skills
claude plugin install avineon@avineon
```

**Check it works:** open a new chat and ask "Is the Avineon MCP server connected, and which Avineon skills do you have?" The agent should confirm the server is connected, list its tools, and name the five skills above.

## Good to know

- **Read-only.** The server and skills cannot run FME, see your data, book a course or issue a quote. They return the right page or contact instead.
- **Safe Software's documentation stays the authority.** `search_fme_docs` returns links and short excerpts, never full pages, and the skills summarise Safe's pages and link to them.
- **What is logged:** the tool called, its inputs trimmed to 200 characters, the client, the country, a daily-changing visitor hash and a random session ID. No IP addresses. Stored in the EU/UK. Details: [agents.avineon.solutions/faq](https://agents.avineon.solutions/faq).
- **Limits:** 120 requests a minute per client.
- **Questions and feedback:** [open an issue](https://github.com/AvineonTensingUK/avineon-fme-skills/issues), or [contact us](https://www.avineon-tensing.com/en-gb/contact).

## About Avineon

[Avineon](https://www.avineon-tensing.com) is a geospatial consultancy with offices in the UK, the Netherlands, Belgium and France. We help utilities, government, transport and agriculture organisations get more from their spatial data with FME, Esri ArcGIS and AI. We publish these skills and the [Avineon MCP server](https://agents.avineon.solutions/) so that AI assistants give accurate, current answers about FME and about what we do.

- **FME:** Safe Software partner and value-added reseller for [FME Form, FME Flow and FME Flow Hosted](https://www.avineon-tensing.com/en-gb/technology/fme/fme-licensing-subscriptions), FME Flow Hosted Managed Service Provider, [certified FME training](https://www.avineon-tensing.com/en-gb/technology/fme/fme-training) in English, Dutch and French, and a Verified Publisher on [FME Hub](https://www.avineon-tensing.com/en-gb/technology/fme/fme-hub)
- **Esri ArcGIS:** Esri partner for [ArcGIS](https://www.avineon-tensing.com/en-gb/technology/arcgis), [ArcGIS Utility Network](https://www.avineon-tensing.com/en-gb/technology/arcgis/arcgis-utility-network) and [ArcGIS Pipeline Referencing](https://www.avineon-tensing.com/en-gb/technology/arcgis/arcgis-pipeline-referencing), and maker of [Backup Manager for ArcGIS Online](https://www.avineon-tensing.com/en-gb/technology/arcgis/back-up-manager)
- **Geospatial data:** [2D data engineering and digitisation](https://www.avineon-tensing.com/en-gb/services/geospatial-data-management/2d-geospatial-data-engineering), [3D city models and digital twins](https://www.avineon-tensing.com/en-gb/services/geospatial-data-management/3d-city-modeling), and [remote sensing](https://www.avineon-tensing.com/en-gb/services/geospatial-data-management/remote-sensing)
- **AI and integration:** [FME integration solutions](https://www.avineon-tensing.com/en-gb/services/geospatial-integration-solutions), MCP servers on FME Flow, AI metadata for ArcGIS, and extraction of data from scanned forms, PDFs and images
- **Managed and professional services:** [monitoring, support and maintenance](https://www.avineon-tensing.com/en-gb/services/geospatial-managed-services) of FME and ArcGIS environments, and [certified GIS, FME and data specialists](https://www.avineon-tensing.com/en-gb/services/geospatial-professional-services) who work in your team

ISO 27001 and Cyber Essentials Plus certified; Crown Commercial Service supplier on G-Cloud 14. [Contact us](https://www.avineon-tensing.com/en-gb/contact).

FME is a trademark of Safe Software Inc. Avineon is a Safe Software partner; this server and these skills are made by Avineon, not by Safe Software.

## Licence

The files in this repository are under the [Apache License 2.0](LICENSE). The hosted server is operated by Avineon and is free to use.
