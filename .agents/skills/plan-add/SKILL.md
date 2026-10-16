---
name: plan-add
description: Capture a new task or idea as a draft plan with relevant context.
---

# plan-add

Locate the plans checkout from an explicit task path or the PLANS_DIR environment variable. If neither is available, use the current checkout only if it contains plan-spec.md and working-agreement.md; otherwise ask for its location. Read those two files in the plans checkout before acting. Resolve templates, context, plans, and handoffs against that checkout, never against the skill installation directory. Work on code in the separately identified repository checkouts.

Read the request and search existing plans and relevant context for duplicates or related work. Capture the outcome and known facts using templates/plan.md in plans/drafts/. Allocate a unique stable ID using plan-spec.md. Link repositories and an initiative only where supported; standalone plans are valid. Preserve open questions rather than inventing decisions. A short draft is sufficient. Report the plan ID and captured questions; do not dispatch.
