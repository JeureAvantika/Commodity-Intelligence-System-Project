from ultralytics import YOLO
import cv2
import numpy as np

# Load YOLOv8 model
model = YOLO("yolov8n.pt")

# Image path
image_path = "C:/Users/harsh/source/repos/NewCISProject/NewCISProject/Image/banana.jpg"
image = cv2.imread(image_path)
image_resized = cv2.resize(image, (640, 640))

# Run YOLO
results = model(image_resized)
detections = results[0].boxes

# COCO classes
class_labels = [  # 80 classes...
    'person','bicycle','car','motorcycle','airplane','bus','train','truck','boat','traffic light',
    'fire hydrant','stop sign','parking meter','bench','bird','cat','dog','horse','sheep','cow',
    'elephant','bear','zebra','giraffe','backpack','umbrella','handbag','tie','suitcase','frisbee',
    'skis','snowboard','sports ball','kite','baseball bat','baseball glove','skateboard','surfboard',
    'tennis racket','bottle','wine glass','cup','fork','knife','spoon','bowl','banana','apple','sandwich',
    'orange','broccoli','carrot','hot dog','pizza','donut','cake','chair','couch','potted plant',
    'bed','dining table','toilet','tv','laptop','mouse','remote','keyboard','cell phone','microwave',
    'oven','toaster','sink','refrigerator','book','clock','vase','scissors','teddy bear','hair drier','toothbrush'
]

threshold = 0.3
filtered_detections = [det for det in detections if det.conf > threshold]

print(f"Detected {len(filtered_detections)} objects.")

# Function to estimate freshness based on average color
def estimate_freshness(crop):
    hsv = cv2.cvtColor(crop, cv2.COLOR_BGR2HSV)
    avg_hue = hsv[:, :, 0].mean()

    if avg_hue < 25:
        return "Overripe"   # Brownish
    elif avg_hue < 35:
        return "Ripe"       # Yellow
    else:
        return "Unripe"     # Green

# Draw detections
for det in filtered_detections:
    x1, y1, x2, y2 = det.xyxy[0].cpu().numpy()
    class_id = int(det.cls)
    confidence = det.conf.item()
    label = class_labels[class_id] if class_id < len(class_labels) else "Unknown"

    # Crop the detected region
    crop = image_resized[int(y1):int(y2), int(x1):int(x2)]

    # If it's a banana, analyze freshness
    freshness = ""
    if label == "banana":
        freshness = estimate_freshness(crop)
        label += f" ({freshness})"

    # Draw box and label
    cv2.rectangle(image_resized, (int(x1), int(y1)), (int(x2), int(y2)), (0, 255, 0), 2)
    label_text = f"{label}: {confidence:.2f}"
    cv2.putText(image_resized, label_text, (int(x1), int(y1) - 10),
                cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 255, 0), 2)

# Show image
cv2.imshow("Detections with Freshness", image_resized)
cv2.waitKey(0)
cv2.destroyAllWindows()