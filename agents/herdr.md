# Herdr and durable planning

Plans and handoffs in a shared checkout hold durable work state. Herdr manages live worker sessions and notifications. Workers save updates first, then notify the coordinator with plan/assignment IDs and the handoff path.

The actual runtime skill is in .agents/skills/herdr/SKILL.md. It was exported from the official Herdr 0.9.5 binary using herdr --skill. Update it from the installed binary when upgrading; the binary's help remains authoritative for syntax.

Herdr's official source and installation instructions: https://github.com/herdrdev/herdr (Apache-2.0). No separate messaging plugin is required.

Open a new terminal after installation, launch herdr from the intended directory, and run your configured agent inside it. Agent runners and authentication are separate installations. Set PLANS_DIR and use coordinator-start with the scope.

Session control requires HERDR_ENV=1; follow the bundled runtime skill. Save handoffs even if notifications fail. No automatic watcher or coordinator loop is installed by these files.

Each coordinator scope uses one named workspace with its workers. Runtime IDs remain local; branches, PRs and handoffs are synced using plan-sync. The upstream Herdr skill is preserved verbatim; explicit user authorization for external named-session control is handled by the coordinator workflow.

Optional Pi fallback: pi-scheduler 0.3.2 was tested with Pi 1.3.0, loaded only into the coordinator via `pi -e <reviewed-extension-path>`. It is not bundled or globally installed here. Its cwd-scoped `.pi/scheduler.json` must not be shared by concurrently scheduled coordinators. Use five-minute checks, preserve unrelated schedules, and delete only the owned schedule on completion/transfer. The timer runs only while Pi is open; no service or ten-second guarantee is implied.
