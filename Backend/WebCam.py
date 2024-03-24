import cv2
import time


class WebCam:
    def __init__(self):
        self.cap = cv2.VideoCapture(0)
        wCam, hCam = 640, 480
        wScr, hScr = 1920, 1080
        self.cap.set(3, wCam)
        self.cap.set(4, hCam)

        self.pTime = 0
        self.cTime = 0

    def get_frame(self):
        success, img = self.cap.read()
        # img = cv2.flip(img, 1)

        # self.cTime = time.time()
        # fps = 1 / (self.cTime - self.pTime)
        # self.pTime = self.cTime
        # cv2.putText(
        #     img, str(int(fps)), (540, 70), cv2.FONT_HERSHEY_PLAIN, 3, (255, 0, 255), 3
        # )

        return success, img
