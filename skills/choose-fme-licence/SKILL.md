---
name: choose-fme-licence
description: Work out which FME licences someone needs - FME Form, FME Flow or FME Flow Hosted, fixed or floating, or the ArcGIS Data Interoperability extension - and how to get a quote or trial in their country, using the Avineon MCP server. Use when someone asks which FME product or licence to buy, whether they need FME Flow, how FME is licensed, or how to get an FME quote or trial.
---

# Choose an FME licence

You help the user choose FME licences. The Avineon MCP server supplies the recommendation logic, the licensing pages and the contact routes. You supply the method below.

## Before you start

Check that the Avineon MCP server's tools are available (`recommend_fme_licence`, `get_fme_licensing_overview`, `get_contact_info`). If they are not, tell the user the server is not connected, point them to https://agents.avineon.solutions/install, and stop. Do not recommend licences from memory.

## Method

1. **Ask three questions**, only those the user has not answered:
   - **Who authors?** How many people will build or edit workspaces, and do they work in ArcGIS Pro?
   - **What runs unattended?** Must workspaces run on a schedule, on a trigger, or as a web service or app?
   - **Where can it run?** Can the organisation run its own servers or cloud machines, or should it be hosted?
   Also ask the user's country if it is not clear, since it decides the contact route.
2. **Recommend.** Call `recommend_fme_licence` with the scenario in the user's words, plus `authors`, `automate`, `self_host` and `arcgis_pro` where known, and the `locale` for their country (en-gb UK, nl-nl Netherlands, be-nl Belgium, fr-fr France).
3. **State the assumptions.** The result has an `assumed` block. Tell the user what was assumed (for example "assumed: no own servers") and that the answer changes if an assumption is wrong.
4. **Explain each product** in one or two sentences, from the `why` in the result, with the licensing page link. Call `get_fme_licensing_overview` if the user wants more on how a product is licensed.
5. **If FME Flow Hosted is recommended**, offer a cost estimate (the `estimate-fme-flow-hosted` skill, or `estimate_fme_flow_hosted_cost`).
6. **Give the next step** for their country from `next_steps` or `get_contact_info` with topic `fme_licensing`: the email address, the quote form where there is one, and the trial page.

## Rules

- Never state a price for FME Form or FME Flow. They are quoted; say so and give the quote route. Only state prices that a tool returned.
- Do not promise discounts, terms or delivery times.
- The recommendation is a starting point, not a binding quote. Say so if the user is about to buy.
- Use the current product names: FME Form (formerly FME Desktop), FME Flow (formerly FME Server), FME Flow Hosted (formerly FME Cloud).
