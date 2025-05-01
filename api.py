from fastapi import FastAPI
from pydantic import BaseModel
import model_predict

app = FastAPI()

class Content(BaseModel):
    text: str

@app.post("/api/predict")
def predict(data: Content):

    print(model_predict.predict(data.text, "XGB"))
    return {"text":data.text, "rating": model_predict.predict(data.text, "XGB")}