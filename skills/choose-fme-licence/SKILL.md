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
   - **Who authors?** How many people will build or edit workspaces, whether they work at the same time (this decides fixed or floating licences), and whether they work only in ArcGIS Pro, only in FME Workbench, or in both?
   - **What runs unattended?** Must workspaces run on a schedule, on a trigger, or as a web service or app?
   - **Where can it run?** Can the organisation run its own servers or cloud machines, or should it be hosted?
   Also ask the user's country if it is not clear, since it decides the contact route.
   If the user has already chosen a product and only wants a quote, ask only what changes the quote (how many people, at the same time or not), then go to step 6.
2. **Recommend.** Call `recommend_fme_licence` with the scenario in the user's words, plus `authors`, `automate`, `self_host` and `arcgis_pro` where known (leave out what the user doesn't know; set `arcgis_pro` only for authors who work only in ArcGIS Pro), and the `locale` for their country (en-gb UK, nl-nl Netherlands, be-nl Belgium, fr-fr France).
3. **State the assumptions.** The result has an `assumed` block. Tell the user what was assumed (for example "assumed: no own servers"), which of those they didn't answer, and that the answer changes if an assumption is wrong.
4. **Explain each product** in one or two sentences, from the `why` in the result, with the licensing page link. Call `get_fme_licensing_overview` if the user wants more on how a product is licensed.
5. **If FME Flow Hosted is recommended**, offer a cost estimate (the `estimate-fme-flow-hosted` skill, or `estimate_fme_flow_hosted_cost`).
6. **Give the next step** for their country from `next_steps` or `get_contact_info` with topic `fme_licensing`: the email address, the phone number where one is returned, the quote form only where a link is returned, and the trial page. If `next_steps` lists training, you may mention it in one line, with the price returned.
7. **ArcGIS Data Interoperability** is an Esri extension, licensed through Esri, not through an FME quote. If it fits, say so and suggest the user asks their Esri distributor; the tools have no Esri quote route.

## Rules

- Never state a price for FME Form or FME Flow. They are quoted; say so and give the quote route. Only state prices that a tool returned (training and FME Flow Hosted prices).
- Do not promise discounts, terms or delivery times.
- The recommendation is a starting point, not a binding quote. Say so if the user is about to buy.
- Use the current product names: FME Form (formerly FME Desktop), FME Flow (formerly FME Server), FME Flow Hosted (formerly FME Cloud).
