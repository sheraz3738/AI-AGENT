# AI Agent integration plan

## Confirmed business configuration
- FNS TRADER'S
- Sheraz Medical & General Store
- Shared contact: +92 334 3738405
- Preferred spoken voice: female, warm and professional
- Languages: Urdu, Roman Urdu, English
- Separate project; do not alter the existing FNS apps.

## Work stages
1. Android app scaffold and APK workflow — completed.
2. Backend webhook foundation — added; not deployed or live.
3. Select and verify telephony/SIP provider for Pakistan and route existing calls only after provider and carrier feasibility are confirmed.
4. Complete Meta Business onboarding and WhatsApp number eligibility check; connect the official Cloud API or supported coexistence path only after explicit owner approval.
5. Add AI conversation engine, Urdu-capable speech recognition and female speech output; configure escalation alerts.
6. End-to-end test with owner test calls/messages; verify privacy, costs, failure handling and customer disclosures.
7. Only then produce and share the production APK.

## Important restrictions
- No automated replies are active yet.
- No phone calls are currently answered by this app.
- No existing WhatsApp account or phone forwarding settings have been changed.
- Never store secrets in GitHub source files.
- Since the same number is the incoming line, the agent cannot transfer a call to that same line. For owner escalation, send an alert/message to the owner and tell the caller the owner will follow up.
