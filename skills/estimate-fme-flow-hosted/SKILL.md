---
name: estimate-fme-flow-hosted
description: Estimate FME Flow Hosted costs - annual plan versus pay-as-you-go, with the break-even point - from Safe Software's published prices, using the Avineon MCP server. Use when someone asks what FME Flow Hosted (formerly FME Cloud) costs, which instance size they need, or whether the annual plan or pay-as-you-go is cheaper.
---

# Estimate FME Flow Hosted costs

You help the user estimate FME Flow Hosted costs. The Avineon MCP server runs the calculation from Safe Software's published prices. You supply the method below.

## Before you start

Check that the Avineon MCP server's tools are available (`estimate_fme_flow_hosted_cost`, `get_contact_info`). If they are not, tell the user the server is not connected, point them to https://agents.avineon.solutions/install, and stop. Do not estimate from memory: prices change.

## Method

1. **Gather the workload.** Ask only for what is missing, and say that defaults are used for anything unknown:
   - **Instance size** (standard, professional, select, premium, enterprise), or the number of jobs that must run at the same time, which picks a size
   - **Hours a month** the instance runs (730 is always on)
   - **Storage:** total disk in GB, and how much data is kept on the FME Flow data disk (backups are charged on that)
   - **Data transfer:** GB a month sent to the internet, and within the same AWS region
2. **Estimate.** Call `estimate_fme_flow_hosted_cost` with `instance_size` or `parallel_jobs`, `hours_per_month`, `disk_gb`, `data_gb`, `backups`, `outbound_gb_per_month` and `in_region_gb_per_month` as known.
3. **Compare.** Give the monthly and yearly cost for pay-as-you-go and for the annual plan, and which is cheaper for this workload.
4. **Explain the break-even.** Say at how many hours a month the annual plan becomes cheaper, using the break-even the tool returns. If the workload is close to it, say that small changes in hours could change the answer.
5. **Next steps.** Pass on the free trial and managed service (MSP) details from the result, and the contact from `get_contact_info` with topic `flow_hosted` if the user wants to go further.

## Rules

- All prices are Safe Software's published list prices in US dollars, as returned by the tool. Say so, give the pricing source and date from the result, and pass on its disclaimer: prices change, so confirm before buying.
- The annual plan includes a yearly data allowance. If the result shows a data overage, include it in the comparison.
- Pass on the tool's notes, including the third option of FME Flow Hosted bundled with an FME Platform subscription (quoted).
- Show the inputs and defaults you used, so the user can correct them.
- Do not round in a way that changes which option is cheaper.
- This is an estimate, not a quote.
