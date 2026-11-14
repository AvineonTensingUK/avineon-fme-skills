# Avineon FME skills

Agent skills for FME tasks: planning a workspace, choosing licences, planning training, estimating FME Flow Hosted costs, and working with FME and the Model Context Protocol (MCP).

Each skill gives an AI agent a method: what to ask, which tools to call and in what order, and what not to claim. The facts come from the [Avineon MCP server](https://agents.avineon.solutions/), a free, public, read-only server with no sign-in. Use the skills and the server together.

The skills follow the open [Agent Skills](https://agentskills.io/specification) format, so they work in any client that supports it, including clients that ignore MCP prompts.

## Skills

| Skill | What it does |
|---|---|
| [`plan-fme-workspace`](skills/plan-fme-workspace/SKILL.md) | Readers, writers and the transformer chain for a data task, with documentation links; flags deprecated transformers. It plans a workspace; it does not build or run one |
| [`choose-fme-licence`](skills/choose-fme-licence/SKILL.md) | FME Form, FME Flow or FME Flow Hosted for a described use, with the assumptions and the quote or trial route for your country |
| [`plan-fme-training`](skills/plan-fme-training/SKILL.md) | A course path for your level and goal, with dates, prices and booking links |
| [`estimate-fme-flow-hosted`](skills/estimate-fme-flow-hosted/SKILL.md) | Annual plan versus pay-as-you-go and the break-even point, from Safe Software's published prices |
| [`expose-fme-workspace-as-mcp-tool`](skills/expose-fme-workspace-as-mcp-tool/SKILL.md) | Publishing FME workspaces as tools on an FME Flow MCP server, and calling MCP servers from FME with the MCPCaller, summarised from Safe Software's documentation with links |

## Install

**1. Connect the MCP server.** The URL is `https://agents.avineon.solutions/mcp` (Streamable HTTP, no authentication). Instructions for Claude, ChatGPT, VS Code, Cursor, Gemini CLI and others: https://agents.avineon.solutions/install

**2. Add the skills** with the [skills](https://github.com/vercel-labs/skills) command-line tool:

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

**Check it works:** open a new chat and ask "Is the Avineon MCP server connected, and which Avineon skills do you have?" The agent should list 18 tools and the five skills above.

## Example prompts

- Which FME transformers do I need to read a CSV of addresses, geocode them and load the points into PostGIS?
- Two analysts convert CAD to GIS every week and want it to run overnight, but we have no servers. Which FME licences do we need?
- I'm new to FME and want to automate jobs on FME Flow. Which courses should I take?
- What would a Professional FME Flow Hosted instance running 200 hours a month cost?
- How do I make one of my FME workspaces available to Claude as an MCP tool?

More: https://agents.avineon.solutions/prompts

## Notes

- The skills and the server are read-only. They cannot book courses, issue quotes or run FME; they return the right page or contact instead.
- Facts about Safe Software products are summarised from Safe's pages and linked. Safe's documentation is the authority.
- Questions and feedback: [open an issue](https://github.com/AvineonTensingUK/avineon-fme-skills/issues), or see https://agents.avineon.solutions/faq.

FME is a trademark of Safe Software Inc. Avineon is a Safe Software partner; these skills are not made or endorsed by Safe Software.

## Licence

[Apache License 2.0](LICENSE)
