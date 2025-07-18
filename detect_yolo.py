from ultralytics import YOLO
import sys
import os
import json

# Get image path from command-line args
image_path = sys.argv[1]

# Load trained model
model = YOLO(r"runs\detect\train\weights\best.pt")

# Run prediction
results = model(image_path)

# Process results
detections = []
for result in results:
    for box in result.boxes:
        cls_id = int(box.cls[0])
        label = model.names[cls_id]
        confidence = float(box.conf[0])
        detections.append({
            "label": label,
            "confidence": round(confidence, 2)
        })

# Output JSON to C# or wherever you need
print(json.dumps(detections))
