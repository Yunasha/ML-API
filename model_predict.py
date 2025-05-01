import joblib, indo_processor

def predict(new_text, model_name):
    model      = joblib.load(f'model\{model_name}_classifier.pkl')
    vectorizer = joblib.load(f'model\{model_name}_vectorizer.pkl')
 
    new_text_clean = indo_processor.process(new_text)
    new_vector     = vectorizer.transform([new_text_clean])

    result = model.predict(new_vector)

    if not result in ["good", "bad"]:
        result = "good" if result else "bad"
    else:
        result = result[0]

    return result == "good" # convert to bool