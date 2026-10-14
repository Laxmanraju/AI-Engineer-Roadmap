import os
from dotenv import load_dotenv
from fastapi import FastAPI, HTTPException
from google import genai
from pydantic import BaseModel

app = FastAPI()
load_dotenv() 
api_key = os.getenv("GEMINI_API_KEY")

client = genai.Client(api_key=api_key)

class ChatRequest(BaseModel):
    message: str

class ChatResponse(BaseModel):
    response: str


@app.get("/health")
async def health():
    return {"status": "ok"}

@app.post("/chat", response_model=ChatResponse)
async def chat(request: ChatRequest):
    try:
        result = await client.aio.models.generate_content(
            model="gemini-2.5-flash",
            contents=request.message,
        )

        return ChatResponse(
            response=result.text or "I couldn't generate a response."
        )

    except Exception as exc:
        print(f"Gemini API error: {exc}")

        raise HTTPException(
            status_code=502,
            detail="Unable to get a response from Gemini.",
        ) from exc