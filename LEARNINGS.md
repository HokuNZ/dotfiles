# Learnings

Lessons captured from past work to inform future development. Updated when merging PRs.

---

## Fork management

- **Watch for missing dependencies**: This fork installs a significantly reduced subset of what upstream provides. Every time we merge from upstream, check for scripts, shell startup files, or install scripts that assume a tool is present. Brewfile changes ripple further than they appear.

- **Scripts must handle uninstalled components cleanly**: Install scripts run regardless of Brewfile state, and shell startup files are sourced on every login. All scripts should guard against missing tools (`command -v` / `[[ -d /Applications/App.app ]]`) and fail gracefully rather than error or - worse - break the shell session.

- **Push bug fixes upstream**: When we fix bugs in this downstream fork, create a PR on the upstream repo (rowan/dotfiles) so the fixes are applied there too. Keep upstream-worthy changes on a separate branch from fork-specific customisations.

- **Comment out Brewfile entries, don't delete them**: Commenting keeps the diff clean against upstream and makes future merges easier.

## GitHub CLI

- **Resolve PR comment threads via GraphQL**: Use `gh api graphql` with the `resolveReviewThread` mutation to programmatically mark review threads as resolved. Requires the thread's node ID from the `reviewThreads` query.
