# from flask import Flask, request, jsonify
# import pandas as pd
# from sklearn.linear_model import LinearRegression
# from flask_cors import CORS

# app = Flask(__name__)
# CORS(app)  # Allow CORS for all domains (change for production)

# # Load dataset and train model ONCE
# df = pd.read_csv("ProductPriceIndex.csv")
# df['farmprice'] = df['farmprice'].replace('[\$,]', '', regex=True)
# df['farmprice'] = pd.to_numeric(df['farmprice'], errors='coerce')
# df = df.dropna(subset=['farmprice'])
# df['month'] = pd.to_datetime(df['date']).dt.month
# df['product_code'] = df['productname'].astype('category').cat.codes
# product_map = dict(zip(df['productname'], df['product_code']))
# normalized_map = {k.strip().lower(): v for k, v in product_map.items()}

# X = df[['product_code', 'month']]
# y = df['farmprice']
# model = LinearRegression()
# model.fit(X, y)

# @app.route('/predict-price', methods=['POST'])
# def predict_price():
#     try:
#         data = request.json
#         commodity = data.get('commodity', '').strip().lower()
#         month = data.get('month')

#         if commodity not in normalized_map:
#             return jsonify({"error": "Commodity not found"}), 400

#         if not isinstance(month, int) or month < 1 or month > 12:
#             return jsonify({"error": "Month must be an integer between 1 and 12"}), 400

#         code = normalized_map[commodity]
#         X_pred = pd.DataFrame([[code, month]], columns=['product_code', 'month'])
#         predicted_price = model.predict(X_pred)[0]

#         return jsonify({"predicted_price": round(predicted_price, 2)})

#     except Exception as e:
#         return jsonify({"error": f"Server error: {str(e)}"}), 500

# if __name__ == '__main__':
#     app.run(debug=True, port=5001)






# from flask import Flask, request, jsonify
# import pandas as pd
# from sklearn.linear_model import LinearRegression
# from flask_cors import CORS

# app = Flask(__name__)
# CORS(app)  # Allow CORS for all domains

# # Load dataset and train model ONCE
# df = pd.read_csv("ProductPriceIndex.csv")
# df['farmprice'] = df['farmprice'].replace('[\$,]', '', regex=True)
# df['farmprice'] = pd.to_numeric(df['farmprice'], errors='coerce')
# df = df.dropna(subset=['farmprice'])
# df['month'] = pd.to_datetime(df['date'], errors='coerce').dt.month
# df['product_code'] = df['productname'].astype('category').cat.codes

# # Create mapping for matching input commodities
# product_map = dict(zip(df['productname'], df['product_code']))
# normalized_map = {k.strip().lower(): v for k, v in product_map.items()}

# # Train the model
# X = df[['product_code', 'month']]
# y = df['farmprice']
# model = LinearRegression()
# model.fit(X, y)

# @app.route('/predict-price', methods=['POST'])
# def predict_price():
#     try:
#         data = request.json
#         commodity_input = data.get('commodity', '').strip().lower()
#         month = data.get('month')

#         # Match commodity case-insensitively
#         matching_key = next((k for k in normalized_map if k.lower() == commodity_input), None)
#         if matching_key is None:
#             return jsonify({"error": f"Commodity '{commodity_input}' not found"}), 400

#         if not isinstance(month, int) or month < 1 or month > 12:
#             return jsonify({"error": "Month must be an integer between 1 and 12"}), 400

#         code = normalized_map[matching_key]
#         X_pred = pd.DataFrame([[code, month]], columns=['product_code', 'month'])
#         predicted_usd = model.predict(X_pred)[0]

#         # Convert USD to INR
#         usd_to_inr = 83
#         predicted_inr = predicted_usd * usd_to_inr

#         return jsonify({
#             "commodity": matching_key,
#             "month": month,
#             "predicted_price_inr": f"₹{round(predicted_inr, 2)} per kg (approx.)"
#         })

#     except Exception as e:
#         return jsonify({"error": f"Server error: {str(e)}"}), 500

# if __name__ == '__main__':
#     app.run(debug=True, port=5001)


from flask import Flask, request, jsonify
import pandas as pd
from sklearn.linear_model import LinearRegression
from flask_cors import CORS

app = Flask(__name__)
CORS(app)  # Allow CORS for all domains

# Load dataset and train model ONCE
df = pd.read_csv("ProductPriceIndex_2.csv")
df['farmprice'] = df['farmprice'].replace('[\$,]', '', regex=True)
df['farmprice'] = pd.to_numeric(df['farmprice'], errors='coerce')
df = df.dropna(subset=['farmprice'])
df['month'] = pd.to_datetime(df['date'], errors='coerce').dt.month
df['product_code'] = df['productname'].astype('category').cat.codes

# Create mapping for matching input commodities
product_map = dict(zip(df['productname'], df['product_code']))
normalized_map = {k.strip().lower(): v for k, v in product_map.items()}

# Train the model
X = df[['product_code', 'month']]
y = df['farmprice']
model = LinearRegression()
model.fit(X, y)

@app.route('/predict-price', methods=['POST'])
def predict_price():
    try:
        data = request.json
        commodity_input = data.get('commodity', '').strip().lower()
        month = data.get('month')

        matching_key = next((k for k in normalized_map if k.lower() == commodity_input), None)
        if matching_key is None:
            return jsonify({"error": f"Commodity '{commodity_input}' not found"}), 400

        if not isinstance(month, int) or month < 1 or month > 12: #Checks if month is valid

            return jsonify({"error": "Month must be an integer between 1 and 12"}), 400

        code = normalized_map[matching_key] #Convert commodity name to a number

        X_pred = pd.DataFrame([[code, month]], columns=['product_code', 'month']) #Prepare input for model(Creates the input data for prediction)

        predicted_usd = model.predict(X_pred)[0]    #Predict price using model
        print(f"Predicted USD price: {predicted_usd}")  # debug log

        # Convert USD to INR and ensure non-negative
        usd_to_inr = 85
        predicted_inr = max(predicted_usd * usd_to_inr, 0)

        # Round and apply minimum threshold if price is too low  (Ensures predicted price is not unrealistically low)
        predicted_inr_rounded = round(predicted_inr, 2)
        if predicted_inr_rounded < 1:
            predicted_inr_rounded = 1.00

        return jsonify({
            "commodity": matching_key,
            "month": month,
            "predicted_price_inr": f"₹{predicted_inr_rounded} per kg (approx.)"
        })

    except Exception as e:
        return jsonify({"error": f"Server error: {str(e)}"}), 500

if __name__ == '__main__':
    app.run(debug=True, port=5001)
