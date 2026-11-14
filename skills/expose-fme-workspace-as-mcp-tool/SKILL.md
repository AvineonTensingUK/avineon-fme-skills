---
name: expose-fme-workspace-as-mcp-tool
description: Explain how FME works with the Model Context Protocol (MCP), from Safe Software's documentation - publishing an FME workspace as a tool on an FME Flow MCP server, and calling an MCP server from an FME workspace with the MCPCaller transformer. Use when someone asks how to make FME workspaces available to AI assistants or agents, how to set up an MCP server on FME Flow, what the MCP Writer does, or how to call an MCP server from FME.
---

# FME and MCP

You explain the two ways FME works with MCP. Every step here comes from Safe Software's pages, linked below, read on 14 November 2026. Link to those pages in your answer; they are the authority and they change. The Avineon MCP server is used to find Safe's current pages, related training and Avineon's own pages.

## Before you start

Find out which direction the user needs:

- **FME Flow as an MCP server:** AI assistants or other MCP clients run the user's FME workspaces as tools.
- **FME Form as an MCP client:** a workspace calls tools on someone else's MCP server, with the MCPCaller transformer.

If the user wants Avineon training or services as well, check that the Avineon MCP server's tools are available (`search_fme_docs`, `search_site`, `get_transformer_details`, `find_fme_training`). If they are not, say the server is not connected and point to https://agents.avineon.solutions/install; you can still explain the steps below from Safe's pages.

## Direction 1: FME Flow as an MCP server

Sources: [MCP Servers (FME Flow documentation)](https://docs.safe.com/fme/html/FME-Flow/WebUI/MCP-Servers.htm), [Getting Started with FME Flow's MCP Server (FME Support Center)](https://support.safe.com/hc/en-us/articles/46668341314701).

How it fits together:

- An FME Flow MCP server is one URL that MCP clients connect to. One FME Flow can host several, for example one per team or data domain.
- Each server has one or more tools. Each tool runs one workspace that is already published to FME Flow. Existing workspaces can be used without changing their logic.
- FME Flow serves tools only, not MCP resources or prompts.

Steps, in Safe's order:

1. **Create the MCP server** on the MCP Servers page in the FME Flow web interface. Give it a title, a name (the URL is generated from it) and a description. Choose the job queue, the job expiry time, and the authentication method: unauthenticated, or OAuth 2.0. OAuth 2.0 needs SAML configured in FME Flow and an authorisation URL; Safe's page has the details.
2. **Create a tool** on the server's Tools tab. Pick the repository and workspace. Give the tool a name (letters, digits, underscores and hyphens, up to 128 characters) and a description.
3. **Write a good description.** Clients use it to decide when to call the tool. Say what the tool does, what it returns and any constraints.
4. **Choose the parameters.** On the Parameters tab, decide which workspace user parameters the client may set, with a name, a description and a default for each.
5. **Decide what the tool returns.** This depends on the workspace's writer:
   - an **MCP Writer** returns content to the client (text, images, audio, resource links or embedded resources)
   - a **JSON Writer** returns its JSON as structured output
   - with neither, the client gets only the job status (success or failure)
6. **Publish the tool.** Only tools with a workspace can be published. If the workspace is changed and republished to FME Flow, the tool is unpublished automatically: review the changes and publish it again.
7. **Start the server.** Clients cannot use it until it is started.

Points to raise with the user:

- A tool runs a full workspace, so it can read, write, update or delete data. Expose only what clients should be able to do, and use authentication and FME Flow's role-based permissions for anything that is not public.
- Changing the server's name changes its URL, so every client then needs the new URL.

## Direction 2: FME Form as an MCP client (MCPCaller)

Sources: [MCPCaller (FME transformer documentation)](https://docs.safe.com/fme/html/FME-Form-Documentation/FME-Transformers/Transformers/pkg-mcpcaller/mcpcaller-pkg.htm), [Getting Started with the MCPCaller (FME Support Center)](https://support.safe.com/hc/en-us/articles/46668357896845/).

- **Requirements:** FME 2026.1 or later, and Python 3.12, 3.13 or 3.14. The server must use the Streamable HTTP transport.
- **What it can do:** list tools, call a tool, list prompts, get a prompt, list resources and read a resource.
- **Connection:** with no authentication, enter the server URL. For servers that need a bearer token or OAuth 2.0, use a web connection.
- **Calling a tool:** choose the tool by name; the transformer shows its input schema and fills in a JSON template. Tool input must be JSON that matches the schema. Results come back as attributes, including a list of the content returned.
- **Modes:** with features on the Input port, it runs once per feature; with nothing connected, it runs once.
- **Errors:** features that fail go to a rejection port with a code and message, so the workspace can handle them.
- **Choosing a tool at run time:** Safe describes listing a server's tools and letting an AI step pick one, so one workspace can route to different tools.

Example to offer: the Avineon MCP server (https://agents.avineon.solutions/mcp) uses Streamable HTTP and needs no authentication, so an MCPCaller with no credentials and that URL can list its tools and call one.

## Using the Avineon MCP server

- `search_fme_docs` with "MCP", "MCP Writer" or "MCPCaller" finds Safe Software's current pages and support articles on these features, with links. Use it to check that the links above still work and to find newer articles; it returns excerpts only, so open the pages for details.
- The transformer catalogue behind `get_transformer_details` may not include MCPCaller. If it is not found, rely on Safe's page above. Use `get_transformer_details` or `find_transformers_for_task` for the transformers around it, such as those that build the JSON input or read the result.
- `find_fme_training` with topic `AI` or `APIs` lists Avineon's related courses.
- `search_site` with "MCP" or "AI" finds Avineon's pages on AI and MCP work, if the user wants help with a project.

## Rules

- Summarise Safe's pages in your own words and link to them. Do not paste long passages.
- If the user asks for a detail that is not on these pages (versions of FME Flow, licensing, limits), say you could not confirm it and point to Safe's documentation or support.
- Do not claim that the Avineon MCP server runs FME or can call FME Flow. It only answers questions.
