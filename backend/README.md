# AI Agent backend

This is the secure starting point for webhook integration. It is not a live customer-facing bot yet.

## Run locally
```bash
python -m venv .venv
# activate the virtual environment, then:
pip install -r requirements.txt
cp .env.example .env
uvicorn main:app --reload --port 8000
```

Health check: `GET /health`

## WhatsApp
- Uses Meta WhatsApp Business Platform Cloud API webhooks.
- `GET /webhooks/whatsapp` implements the Meta verification handshake.
- `POST /webhooks/whatsapp` validates Meta's HMAC signature when an app secret is configured.
- The endpoint intentionally does not send automated replies until the business number is onboarded, credentials are stored securely, and the AI reply policy is tested.

The currently used account is reported to be normal WhatsApp Messenger. The official coexistence route is for the WhatsApp Business app plus the Platform, not the consumer Messenger app. Do not migrate or re-register the user's number without their explicit approval and an eligibility check.

## Phone calls
The voice webhook is only a placeholder. A licensed telephony/SIP provider and a confirmed route for the existing Pakistani mobile number are required. Do not assume a Twilio +92 local number is available. The provider must be checked for local number/forwarding support, costs, KYC and caller-ID behavior before activation.

## Secrets and privacy
- Never commit `.env`, API tokens, app secrets, verification codes, or provider credentials.
- Store production secrets in the hosting provider's secret manager.
- Do not log customer message bodies, call audio, or personal data by default.
- The AI must identify itself as an automated assistant and must not invent stock, prices, medical advice, or order status.
- When it cannot verify an important detail, it should ask the owner to follow up rather than guess.
