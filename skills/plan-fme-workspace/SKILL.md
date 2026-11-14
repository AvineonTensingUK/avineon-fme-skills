---
name: plan-fme-workspace
description: Plan an FME workspace for a data task - readers, writers, the transformer chain and the documentation for each transformer - using the Avineon MCP server. Use when someone asks how to do a data conversion, integration or spatial analysis in FME (FME Form, FME Workbench), which FME transformers to use, or whether a transformer is deprecated. Plans only; it does not build or run a workspace.
---

# Plan an FME workspace

You help the user plan an FME workspace. The Avineon MCP server supplies the facts: transformer descriptions, how widely each is used, common neighbours, example workflows and documentation links. You supply the method below.

Say plainly at the start or the end: this is a plan for the user to build in FME Workbench. You do not build, run or test the workspace.

## Before you start

Check that the Avineon MCP server's tools are available (`find_transformers_for_task`, `get_transformer_details`, `search_fme_transformers`, `search_fme_docs`). If they are not, tell the user the server is not connected, point them to https://agents.avineon.solutions/install, and stop. Do not plan from memory: transformer names and statuses change between FME releases.

## Method

1. **Clarify the task.** You need three things. Ask only for what is missing, in one short message:
   - the source: format, system, and roughly how much data
   - the target: format or system, and the schema if it matters
   - the transformation: what has to happen in between (joins, geometry work, validation, filtering, reprojection)
2. **Get candidates.** Call `find_transformers_for_task` with the task in plain words, including the formats. Note the suggested transformers, any `readers_and_writers`, and the example chains.
3. **Check each key transformer.** Call `get_transformer_details` for every transformer you will put in the plan (usually three to eight). Use the description, the documentation link and `commonly_preceded_by` / `commonly_followed_by` to confirm the order. If a name is not found, use one of the `did_you_mean` names, or `search_fme_transformers` with the capability you need.
4. **Flag deprecated or renamed transformers.** If a description says a transformer is deprecated or replaced, or the result has `now_called`, use the successor in the plan and say which one it replaces. If the result has `safe_transformer: false`, say it is not a Safe Software transformer (a custom or FME Hub transformer) and offer a built-in alternative where one exists.
5. **Find the reader and writer documentation.** Call `search_fme_docs` with the format and "reader" or "writer" (for example "PostGIS writer"), with `kind` set to `documentation`, for Safe Software's pages on the formats and their parameters. Add `support` articles when the task has a known pitfall.
6. **Write the plan.**
   - Readers: format and the key settings to choose
   - The transformer chain, in order, one line each: what it does in this workspace
   - Writers: format, and the writer mode if it matters (insert, update)
   - Points to check: assumptions, data quality risks, performance for large data
   - Links: the documentation link of each transformer and format, and any example workflows the tools returned
7. **Optional next steps.** If the tools returned `learn_more` (Avineon training or articles), mention them in one line. Do not push them.

## Rules

- Only name transformers that the tools returned or confirmed. If you are unsure whether one exists, check it with `get_transformer_details`.
- Cite the documentation links the tools return; do not invent URLs. `search_fme_docs` returns short excerpts only: open the page, or ask the user to, before relying on a detail that is not in the excerpt.
- Usage counts describe Avineon's FME knowledge base, not all FME users. Present them as "widely used", not as rankings.
- Keep FME terms exact: feature types, attributes, readers, writers, ports.
