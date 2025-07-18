# Commodity-Intelligence-System-Project (CIS) 

# Project Overview

Commodity Intelligence System (CIS) is a smart web-based platform that connects farmers and traders, while using machine learning to detect commodities and predict their prices. The system uses image recognition to detect the uploaded commodity (fruit/vegetable) and calculate the detection accuracy, and also provides a price prediction based on selected parameters.

This platform is built with a focus on improving transparency in agricultural trading by allowing farmers to upload commodity images, and enabling traders to view commodity details and directly contact farmers.

# User Roles & Features

#1. Farmer Dashboard
- Can register and log in to the platform.
- On login, farmers can:
  - Upload an image of one of the supported commodities:  
    `Apple`, `Banana`, `Potato`, `Capsicum`, `Onion`
  - The system uses a **YOLOv8 model** to:
    - Detect the fruit or vegetable from the image
    - Calculate the **detection accuracy**
  - Fill a form with:
    - Selected commodity (from dropdown)
    - Month number (1–12)
  - The platform predicts the expected market price based on the selected values using a trained regression model.

#2. Trader Dashboard
- Can register and log in to access a list of all active farmers.
- For each farmer, traders can view:
  - Name of the fruit/vegetable
  - Uploaded image of the commodity
  - Date of image upload
  - Detection accuracy (from YOLOv8)
  - Location of the farmer
  - Phone number for direct contact

#3. Admin Dashboard
- Can log in to view:
  - List of all registered farmers and traders
  - All help messages/suggestions submitted by users

#Tech Stack
  Frontend :-              HTML, CSS, JavaScript 
  Backend :-               ASP.NET (C#) 
  Machine Learning :-      Python (YOLOv8 + Sklearn)
  Database :-              SQL Server  
  

#Machine Learning Models Used

#1. YOLOv8 – Commodity Detection
- Trained to recognize: `Apple`, `Banana`, `Potato`, `Capsicum`, and `Onion`
- When a farmer uploads an image, the model:
  - Detects the fruit/vegetable in the image
  - Calculates a **confidence score (accuracy %)**
- This accuracy is shown to traders for validation.

#2. Regression Model – Price Prediction
- Based on:
  - Selected commodity
  - Month number
- Predicts market price using historical trend data.

#3 Link for the Dataset
  https://drive.google.com/drive/folders/1iINQST7vLmkMckZ0o6ZS0D7aoTUavm-0?usp=sharing

  
#Important:  
> Both YOLOv8 and Regression models **must be trained** before deployment.  
> The system relies on these models to:
> - Validate the commodity (via detection accuracy)
> - Predict price reliably  
> Without trained models, the system will not produce meaningful outputs.



