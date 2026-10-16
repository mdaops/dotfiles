---
name: plan-init
description: Initialize a plans repository with the agreed layout and shared workflow rules.
---

# plan-init

Locate the target from an explicit task path or PLANS_DIR; ask if it is unspecified. For an existing plans checkout read its plan-spec.md and working-agreement.md. For a new target read the defaults in assets/bootstrap/ relative to this skill. The bundled defaults are an initialization snapshot; an existing repository's rules take precedence.

Inspect the target directory and existing Git state first. Copy only missing files from assets/bootstrap/, preserving their relative paths. Create plans/drafts/, plans/next/, plans/open/, plans/done/, plans/discarded/, context/, initiatives/, handoffs/, and local/. Add .gitkeep files to empty tracked directories. Preserve existing files and user changes; do not duplicate initialization. Add machine details only under ignored local/. Verify the layout and report what was created. Git remote creation, pushing, or installing runner configuration requires authorization from the current task; initialization alone does not imply it.

Also scaffold coordinators/ using the bundled README and updates.md. For an explicitly requested scope, create a missing profile from templates/coordinator.md. Preserve existing policies; report conflicts rather than silently overriding them. This workflow uses a shared checkout and handoffs; initialization does not start monitoring or workers.
