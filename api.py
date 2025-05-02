from fastapi  import FastAPI
from pydantic import BaseModel
import model_predict

app = FastAPI()
class Content(BaseModel): text: str
class ContentMass(BaseModel): texts: list[str]


@app.post("/api/predict")
def predict(data: Content):

    prediction = model_predict.predict(data.text, "XGB")
    print(f"""
data  :   {data!r}
result:   {prediction!r}""")

    return {"text": data.text, "is_positive": prediction}

@app.post("/api/predict-mass")
def predict_mass(data: ContentMass):
    
    predictions = []
    for line in data.texts:
        prediction = model_predict.predict(line, "XGB")
        predictions.append(prediction)
        print(f"""
data  :   {line!r}
result:   {prediction!r}""")
        
    return {"texts": data.texts, "is_positives": predictions}