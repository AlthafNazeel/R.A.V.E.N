import os
import cv2
import numpy as np
from collections import deque
from tensorflow.keras.models import load_model


class DetectionModel:
    def __init__(self):
        file_path = os.path.dirname(os.path.abspath(__file__))

        self.CLASSES_LIST = ["non-violent", "violent"]

        self.MoBiLSTM_model = load_model(os.path.join(file_path, "model.h5"))

    def predict_frame(self, frames):
        predicted_labels_probabilities = self.MoBiLSTM_model.predict(
            np.expand_dims(frames, axis=0)
        )[0]

        predicted_label = np.argmax(predicted_labels_probabilities)

        return self.CLASSES_LIST[predicted_label]
