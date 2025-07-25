from fastapi import FastAPI

api = FastAPI(
    title="Portfolio API",
    description="An API to my portfolio fullstack",
    version="0.0.1"
)

@api.get("/")
def root():
    return {
        "status": 200,
        "message": "Welcome to Portfolio API"
    }

