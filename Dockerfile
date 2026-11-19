# The Avineon MCP server is hosted at https://agents.avineon.solutions/mcp (Streamable HTTP, no sign-in).
# This image runs a stdio bridge to it, for MCP clients and directories that start servers as local processes.
FROM node:22-alpine
RUN npm install -g mcp-remote@0.16.1
ENTRYPOINT ["mcp-remote", "https://agents.avineon.solutions/mcp", "--transport", "http-only"]
