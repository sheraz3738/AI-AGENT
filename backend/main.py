import hashlib
import hmac
import os
from typing import Any

from dotenv import load_dotenv
from fastapi import FastAPI, Header, HTTPException, Query, Request
from fastapi.responses import PlainTextResponse

load_dotenv()

app = FastAPI(
    title="AI Agent Backend",
    description="Webhook foundation for FNS TRADER'S and Sheraz Medical & General Store.",
    version="0.1.0",
)


@app.get("/health")
async def health() -> dict[str, str]:
    return {"status": "ok", "service": "ai-agent-backend"}


@app.get("/webhooks/whatsapp", response_class=PlainTextResponse)
async def verify_whatsapp_webhook(
    mode: str | None = Query(default=None, alias="hub.mode"),
    token: str | None = Query(default=None, alias="hub.verify_token"),
    challenge: str | None = Query(default=None, alias="hub.challenge"),
) -> PlainTextResponse:
    """Meta webhook verification handshake."""
    expected = os.getenv("WHATSAPP_VERIFY_TOKEN", "")
    if mode == "subscribe" and expected and hmac.compare_digest(token or "", expected):
        return PlainTextResponse(challenge or "")
    raise HTTPException(status_code=403, detail="Webhook verification failed")


@app.post("/webhooks/whatsapp")
async def receive_whatsapp_webhook(
    request: Request,
    x_hub_signature_256: str | None = Header(default=None),
) -> dict[str, str]:
    """Validate Meta's signature and accept event payloads.

    Deliberately does not auto-reply yet: live AI replies must only be enabled
    after Meta onboarding, consent, credentials, and tested business policies.
    """
    body = await request.body()
    app_secret = os.getenv("WHATSAPP_APP_SECRET", "")
    if app_secret:
        expected = "sha256=" + hmac.new(
            app_secret.encode("utf-8"), body, hashlib.sha256
        ).hexdigest()
        if not x_hub_signature_256 or not hmac.compare_digest(
            x_hub_signature_256, expected
        ):
            raise HTTPException(status_code=401, detail="Invalid webhook signature")

    # Parse to ensure the event is valid JSON. Do not log customer message content.
    try:
        import json
        payload: Any = json.loads(body or b"{}")
    except ValueError as exc:
        raise HTTPException(status_code=400, detail="Invalid JSON") from exc

    if not isinstance(payload, dict):
        raise HTTPException(status_code=400, detail="Unexpected webhook payload")

    # TODO: route verified inbound messages to the configured AI responder,
    # persist minimal conversation state securely, and send replies via Cloud API.
    return {"status": "accepted", "automation": "not_enabled"}


@app.post("/webhooks/voice")
async def receive_voice_webhook(request: Request) -> dict[str, str]:
    """Placeholder for the selected licensed SIP/telephony provider webhook."""
    # TODO: verify provider signature and connect its media/streaming interface
    # to the selected Urdu-capable speech/AI voice service.
    await request.body()
    return {"status": "received", "voice_agent": "not_enabled"}
