

# 29th may api created

from flask import Flask, request, jsonify
from ultralytics import YOLO
import cv2
import numpy as np

# Initialize Flask app
app = Flask(__name__)

# Load YOLO model
model_path = "runs/detect/train3/weights/best.pt"  # Update path if needed
model = YOLO(model_path)

# Class names
class_names = [
  'apple_ripe', 'apple_unripe', 'capsicum_fresh', 'capsicum_unripe', 'capsicum_overripe',
  'banana_ripe', 'banana_unripe', 'banana_overripe',
  'onion_fresh', 'onion_rotten', 'potato_fresh', 'potato_rotten'
]

# Class descriptions
descriptions = {
    'apple_ripe': "Apple is ripe and ready to eat.",
    'apple_unripe': "Apple is unripe, wait for ripening.",
    'capsicum_ripe': "Capsicum is ripe and ready to eat.",
    'capsicum_unripe': "Capsicum is unripe.",
    'capsicum_overripe': "Capsicum is overripe, not suitable for eating.",
    'banana_ripe': "Banana is ripe and sweet.",
    'banana_unripe': "Banana is unripe, not ready yet.",
    'banana_overripe': "Banana is overripe, may be spoiled.",
    'onion_fresh': "Onion is fresh.",
    'onion_rotten': "Onion is rotten.",
    'potato_fresh': "Potato is fresh.",
    'potato_rotten': "Potato is rotten."
}

@app.route('/predict', methods=['POST'])
def predict():
    if 'file' not in request.files:
        return jsonify({"status": "No file part"}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({"status": "No file selected"}), 400

    # Read image from request
    npimg = np.frombuffer(file.read(), np.uint8)
    image = cv2.imdecode(npimg, cv2.IMREAD_COLOR)

    # Run YOLO detection
    results = model(image)
    boxes = results[0].boxes

    if boxes is None or len(boxes) == 0:
        return jsonify({"status": "No objects detected"})

    # Just take the first box
    box = boxes[0]
    cls_id = int(box.cls[0])
    class_name = class_names[cls_id]
    status = class_name.replace("_", " ").capitalize()  # format nicely

    return jsonify({"status": status})
  

# Run the Flask app on port 5000
if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)





































    # main model
# from flask import Flask, request, jsonify
# from ultralytics import YOLO
# import cv2
# import numpy as np

# app = Flask(__name__)
# model = YOLO("yolov8n.pt")

# # class_labels = ["Apple", "Banana", "Mango", "Tomato", "Grapes", "Orange", "Pineapple", "Papaya"]

# def estimate_freshness(crop):
#     hsv = cv2.cvtColor(crop, cv2.COLOR_BGR2HSV)
#     avg_hue = hsv[:, :, 0].mean()
#     if avg_hue < 25:
#         return "Ripe"
#     elif avg_hue < 35:
#         return "Overripe"
#     else:
#         return "Unripe"

# @app.route('/predict', methods=['POST'])
# def predict():
#     if 'file' not in request.files:
#         return "No file part in the request", 400

#     file = request.files['file']

#     if file.filename == '':
#         return "No file selected", 400

#     npimg = np.frombuffer(file.read(), np.uint8)
#     image = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
#     image_resized = cv2.resize(image, (640, 640))

#     results = model(image_resized)
#     detections = results[0].boxes
#     threshold = 0.3
#     filtered_detections = [det for det in detections if det.conf > threshold]

#     if not filtered_detections:
#         return jsonify({"freshness": "Unknown"})

#     det = filtered_detections[0]
#     x1, y1, x2, y2 = map(int, det.xyxy[0].cpu().numpy())
#     crop = image[y1:y2, x1:x2]
#     freshness = estimate_freshness(crop)

#     return jsonify({"freshness": freshness})

# if __name__ == '__main__':
#     app.run(host='127.0.0.1', port=5000)











# from flask import Flask, request, jsonify
# from ultralytics import YOLO
# import cv2
# import numpy as np

# app = Flask(__name__)

# # Load YOLOv8 model (replace with your custom trained model if needed)
# model = YOLO("C:\Users\harsh\Downloads\FruitVegiesDataset.v1i.yolov8\runs\detect\train\best.pt")
#  # Replace with "best.pt" if using custom model
# print(model.names)  # ✅ Print class names to verify your model

# # Freshness hue ranges per label
# freshness_hue_ranges = {
#     "onion": {"ripe": (0, 25), "overripe": (26, 40), "unripe": (41, 180)},
#     "apple": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "carrots": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "cabbage": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "spinach": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "chilli": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "capsicum": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "lemon": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "garlic": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "ladyfinger": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "beetroot": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "potatoes": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "watermelon": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "cucumber": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)},
#     "tomatoes": {"ripe": (0, 25), "overripe": (26, 35), "unripe": (36, 180)}
# }

# # Estimate freshness based on average hue and label
# def estimate_freshness(crop, label):
#     if crop.size == 0:
#         return "Unknown"
#     hsv = cv2.cvtColor(crop, cv2.COLOR_BGR2HSV)
#     avg_hue = hsv[:, :, 0].mean()
#     ranges = freshness_hue_ranges.get(label.lower())
#     if not ranges:
#         return "Unknown"
#     if ranges["ripe"][0] <= avg_hue <= ranges["ripe"][1]:
#         return "Ripe"
#     elif ranges["overripe"][0] <= avg_hue <= ranges["overripe"][1]:
#         return "Overripe"
#     else:
#         return "Unripe"

# # Verify label based on hue range
# def verify_label_with_hue(label, avg_hue):
#     ranges = freshness_hue_ranges.get(label.lower())
#     if not ranges:
#         return label
#     if (ranges["ripe"][0] <= avg_hue <= ranges["ripe"][1] or
#         ranges["overripe"][0] <= avg_hue <= ranges["overripe"][1] or
#         ranges["unripe"][0] <= avg_hue <= ranges["unripe"][1]):
#         return label
#     return "unknown"

# @app.route('/predict', methods=['POST'])
# def predict():
#     file = request.files['file']
#     npimg = np.frombuffer(file.read(), np.uint8)
#     image = cv2.imdecode(npimg, cv2.IMREAD_COLOR)
#     image_resized = cv2.resize(image, (640, 640))

#     results = model(image_resized)
#     detections = results[0].boxes
#     threshold = 0.3
#     filtered_detections = [d for d in detections if d.conf > threshold]

#     if not filtered_detections:
#         return jsonify({"freshness": "Unknown", "label": "None"})

#     det = filtered_detections[0]
#     x1, y1, x2, y2 = map(int, det.xyxy[0].cpu().numpy())
#     crop = image[y1:y2, x1:x2]
#     cls_id = int(det.cls[0].cpu().numpy())
#     original_label = model.names[cls_id].lower()

#     hsv = cv2.cvtColor(crop, cv2.COLOR_BGR2HSV)
#     avg_hue = int(np.mean(hsv[:, :, 0]))

#     verified_label = verify_label_with_hue(original_label, avg_hue)
#     if verified_label == "unknown" and 0 <= avg_hue <= 40:
#         verified_label = "onion"  # fallback fix for misclassification

#     freshness = estimate_freshness(crop, verified_label)

#     return jsonify({
#         "freshness": freshness,
#         "label": verified_label,
#         "original_label": original_label,
#         "avg_hue": avg_hue,
#         "confidence": float(det.conf[0])
#     })

# if __name__ == '__main__':
#     app.run(host='127.0.0.1', port=5000)







# 29th may
# from ultralytics import YOLO

# # Path to your trained weights
# model_path = "runs/detect/train2/weights/best.pt"  # Update if different

# # Image path to test
# # image_path = r"C:/Users/harsh/source/repos/Freshness Model/FruitFreshnessDataset/train/images/ajonion2rotten.jpeg"

# # Load model
# model = YOLO(model_path)

# # Updated class names
# class_names = [
#   'apple_ripe',         # 0
#   'apple_unripe',       # 1
#   'capsicum_fresh',     # 2 
#   'capsicum_unripe',    # 3
#   'capsicum_overripe',  # 4
#   'banana_ripe',        # 5
#   'banana_unripe',      # 6
#   'banana_overripe',    # 7
#   'onion_fresh',        # 8
#   'onion_rotten',       # 9
#   'potato_fresh',       #10
#   'potato_rotten'       #11
# ]

# # Descriptions
# descriptions = {
#     'apple_ripe': "Apple is ripe and ready to eat.",
#     'apple_unripe': "Apple is unripe, wait for ripening.",
#     'capsicum_ripe': "Capsicum is ripe and ready to eat.",
#     'capsicum_unripe': "Capsicum is unripe.",
#     'capsicum_overripe': "Capsicum is overripe, not suitable for eating.",
#     'banana_ripe': "Banana is ripe and sweet.",
#     'banana_unripe': "Banana is unripe, not ready yet.",
#     'banana_overripe': "Banana is overripe, may be spoiled.",
#     'onion_fresh': "Onion is fresh.",
#     'onion_rotten': "Onion is rotten.",
#     'potato_fresh': "Potato is fresh."
# }

# # Run prediction on the image
# results = model(image_path)
# boxes = results[0].boxes

# if len(boxes) == 0:
#     print("No objects detected.")
# else:
#     for box in boxes:
#         cls_id = int(box.cls[0])
#         conf = box.conf[0].item()
#         class_name = class_names[cls_id]
#         desc = descriptions.get(class_name, "No description available.")
        
#         print(f"Detected {class_name} with confidence {conf:.2f}")
#         print(f"Description: {desc}\n")


