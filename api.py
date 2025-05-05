from fastapi  import FastAPI
from pydantic import BaseModel
import model_predict

app = FastAPI()
class ContentMass(BaseModel): texts: list[str]

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