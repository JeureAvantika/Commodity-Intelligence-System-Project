from ultralytics import YOLO

# Load a new YOLOv8 model
model = YOLO("yolov8n.pt")  # or yolov8s.pt for better accuracy

# Train the model
model.train(
    data=r"C:\Users\harsh\Downloads\FruitVegiesDataset.v1i.yolov8\data.yaml",  # path to your data.yaml
    epochs=50,
    imgsz=640
)
