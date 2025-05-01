from fastapi  import FastAPI
from pydantic import BaseModel
import model_predict

app = FastAPI()
class Content(BaseModel): text: str

@app.post("/api/predict")
def predict(data: Content):

    prediction = model_predict.predict(data.text, "XGB")
    print(f"""
data  :   {data!r}
result:   {prediction!r}""")

    return{"text": data.text, "rating": prediction}