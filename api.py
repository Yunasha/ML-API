from fastapi import FastAPI
from pydantic import BaseModel
import model_joblib

app = FastAPI()

# # Define expected input using Pydantic
# class Numbers(BaseModel):
#     a: float
#     b: float

# # POST endpoint to add two numbers
# @app.post("/api/add")
# def add_numbers(numbers: Numbers):
#     result = numbers.a + numbers.b
#     return {"result": result}

# @app.post("/api/sub")
# def sub_numbers(numbers: Numbers):
#     result = numbers.a - numbers.b
#     return {"result": result}

class Content(BaseModel):
    text: str

@app.post("/api/predict")
def predict(data: Content):
    return {"text":data.text, "rating": model_joblib.predict(data.text)}