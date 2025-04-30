import joblib, indo_processor

# Load model and vectorizer
model = joblib.load('classifier.pkl')
vectorizer = joblib.load('vectorizer.pkl')

def predict(new_text):

# Example new text
# new_text = "seperti yang ku pengen, kualitasnya bagus"
# Preprocess (same as before)
    new_text_clean = indo_processor.process(new_text)

    # Vectorize
    new_vector = vectorizer.transform([new_text_clean])

    # Predict
    return model.predict(new_vector)[0]
# print("Predicted label:", prediction[0])