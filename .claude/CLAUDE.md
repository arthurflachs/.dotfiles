# Global Claude Code Instructions

## Web Fetching & Browser Fallback

When fetching URLs, if you get a **403 error** (or any access-denied / bot-detection response), immediately fall back to using the browser MCP tools (`mcp__chrome-devtools__*` or `mcp__plugin_playwright_playwright__*`) instead of retrying fetch.

### Browser MCP usage guidelines

- **Captchas**: If a captcha appears, notify the user and ask them to solve it, then continue once they confirm.
- **Login walls**: If the page requires login, ask the user whether they want to log in manually before continuing. Wait for confirmation.
- **Cookie consent / popups**: Dismiss them automatically if possible (click "Accept" or "Close"), otherwise skip and proceed to extract the content.
- **Navigation**: Use `browser_navigate` → `browser_snapshot` to read page content. Only use `browser_take_screenshot` if a visual check is needed.
- **Prefer Playwright** (`mcp__plugin_playwright_playwright__*`) over Chrome DevTools unless only one is available.

### General rule

> If `WebFetch` fails with 403, bot detection, or access error → switch to browser MCP without asking. Do notify the user briefly ("Fetch blocked, using browser instead.").
