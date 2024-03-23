from collections import deque
from WebCam import WebCam
from detection import EmergencyDetection


def main():
    camera = WebCam()
    det = EmergencyDetection()
    det.run()


if __name__ == "__main__":
    main()
