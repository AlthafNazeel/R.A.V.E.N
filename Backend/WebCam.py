import cv2
import time


class WebCam:
    def __init__(self) -> None:
        self.cap = cv2.VideoCapture(
            0
        )  # Gets the Camera, 0 for integrated Camera, 1 for external Camera
        wCam, hCam = 640, 480  # Width and Height of window and Camera
        wScr, hScr = 1920, 1080  # Width and Height of your Monitor
        self.cap.set(3, wCam)
        self.cap.set(4, hCam)

        self.pTime = 0
        self.cTime = 0

    def get_frames(self):

        success, img = self.cap.read()  # Gets each Frame of the video
        img = cv2.flip(img, 1)

        self.cTime = time.time()
        fps = 1 / (self.cTime - self.pTime)
        self.pTime = self.cTime
        cv2.putText(
            img, str(int(fps)), (10, 70), cv2.FONT_HERSHEY_PLAIN, 3, (255, 0, 255), 3
        )
        cv2.imshow("Image", img)
        cv2.waitKey(1)

        return img
