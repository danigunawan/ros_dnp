from object_template_matching import TemplateMatching
from sensor_msgs.msg import Image
from smelling_detection.msg import Rectangle, ObjectStatus
import time
import rospy
import cv2
import numpy as np

color_img = None

def color_cb(data):
    
    global color_img
    decoded = np.frombuffer(data.data, np.uint8)
    img = np.reshape(decoded, (480,640, 3))
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    color_img = img

def create_obj_status(name_objects, exists_objects_name, dict_box_objects):
    msg = ObjectStatus()
    msg.exists = []
    msg.objects = []
    msg.object_rect = []

    for name in name_objects:
        msg.objects.append(name)
        rect = Rectangle()
        (x1,y1) ,(x2,y2) = dict_box_objects[name]
        rect.x1 = x1
        rect.x2 = x2
        rect.y1 = y1
        rect.y2 = y2

        if name in exists_objects_name:
            msg.exists.append(True)
        else:
            msg.exists.append(False)

        msg.object_rect.append(rect)

    return msg

def main():

    rospy.init_node("object_status_node", anonymous=True)
    rospy.Subscriber("/camera/color/image_raw", Image, color_cb)
    objectmatching = TemplateMatching()
    name_objects = objectmatching.get_name_objects()
    pub_object_status = rospy.Publisher("object_status", ObjectStatus, queue_size=10)
    time.sleep(1)
    #cv2.namedWindow("object_checking", cv2.WINDOW_NORMAL)
    #cv2.resizeWindow("object_checking", 600, 400)

    while True:

        if color_img is None:
            continue

        exists_objects_name, dict_box_objects = objectmatching.\
                check_multi_objects_in_image(color_img)
        frame = objectmatching.visual_exists_object(color_img, exists_objects_name)
        print(frame.shape)
        cv2.imshow("object_checking", frame)
        cv2.waitKey(10)
        msg = create_obj_status(name_objects, exists_objects_name, dict_box_objects)
        pub_object_status.publish(msg)
    
    rospy.spin()
    cv2.destroyAllWindows()


if __name__=="__main__":
    main()
