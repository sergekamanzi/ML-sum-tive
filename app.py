from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
import joblib
from fastapi.middleware.cors import CORSMiddleware  # Import CORSMiddleware

# Initialize FastAPI app
app = FastAPI()

# Allow CORS for all origins or specific origins
origins = [
    "*",  # This will allow all domains. You can also specify a list of allowed origins
    # "http://example.com",  # You can specify domains you want to allow here
    # "https://yourfrontend.com"
]

# Add CORSMiddleware to your app
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,  # Specifies which origins are allowed to access your app
    allow_credentials=True,
    allow_methods=["*"],  # Allows all HTTP methods (GET, POST, etc.)
    allow_headers=["*"],  # Allows all headers
)

# Load the saved model and scaler
model = joblib.load('wine_quality_model.joblib')
scaler = joblib.load('scaler.joblib')

# Define the input data model (using Pydantic)
class WineInput(BaseModel):
    fixed_acidity: float
    volatile_acidity: float
    citric_acid: float
    residual_sugar: float
    pH: float
    alcohol: float

# Define the prediction route
@app.post("/predict/")
def predict_wine_quality(input_data: WineInput):
    # Convert input data to a numpy array
    features = np.array([[input_data.fixed_acidity, input_data.volatile_acidity, input_data.citric_acid,
                          input_data.residual_sugar, input_data.pH, input_data.alcohol]])

    # Scale the input features using the same scaler used during training
    features_scaled = scaler.transform(features)

    # Predict the wine quality using the trained model
    prediction = model.predict(features_scaled)[0]

    # Ensure the predicted quality is within the 0-10 range (round to nearest value)
    predicted_quality = round(np.clip(prediction, 0, 10), 2)

    # Return the result as a response
    return {"predicted_quality": predicted_quality}
