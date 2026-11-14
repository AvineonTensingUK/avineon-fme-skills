---
name: plan-fme-training
description: Plan an FME training path - which courses, in which order, with dates, prices and booking links - using the Avineon MCP server. Use when someone asks which FME course to take, how to learn FME Form or FME Flow, about FME + AI or FME API training, ArcGIS Data Interoperability training, FME Skill Booster workshops, or when the next FME course dates are.
---

# Plan FME training

You help the user choose FME training. The Avineon MCP server supplies the courses, levels, prices, durations, dates and booking links. You supply the method below.

## Before you start

Check that the Avineon MCP server's tools are available (`find_fme_training`, `list_events`). If they are not, tell the user the server is not connected, point them to https://agents.avineon.solutions/install, and stop. Do not quote courses, prices or dates from memory.

## Method

1. **Establish level and goal.** Ask only for what is missing:
   - experience: new to FME, some use, or regular use (and of which product)
   - goal: what they want to be able to do (translate data, write maintainable workspaces, automate on FME Flow, call APIs, use AI, work inside ArcGIS Pro)
   - country or language, since it decides the course language and currency
2. **Find courses.** Call `find_fme_training` with `level`, `product` or `topic` where they fit, and `locale` for their country. If nothing matches, the tool returns all courses: pick from those.
3. **Propose a path** of one to three courses in order, each with: name, level, duration, price and upcoming dates exactly as returned, and the course or booking link. Say in one line why each course fits the goal.
4. **Free options.** If the user is new or wants to try first, mention the FME Skill Booster workshops if the tool returned them. For other events, call `list_events`.
5. **How to book.** Give the booking link or form, and the `book_or_ask` contact for in-house or group training.

## Rules

- Give prices and dates only as the tools return them. If a course has no dates, say "see the course page or ask for dates". Note that VAT is added where it applies.
- If a course is only available in English for a non-English locale, pass on the tool's `language_note`.
- Courses booked through Esri UK (ArcGIS Data Interoperability) have their price on Esri UK's page: say so instead of giving a price.
- Do not book anything. Give the link.
