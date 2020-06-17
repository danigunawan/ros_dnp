from object_template_matching import TemplateMatching
from smelling_detection.msgs import Rectangle, ObjectStatus
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

        if name in exists_objects_name:
            msg.exists.append(True)
            rect = Rectangle()
            x1,y1,x2,y2 = dict_box_objects[name]
            rect.x1 = x1
            rect.x2 = x2
            rect.y1 = y1
            rect.y2 = y2
            msg.object_rect.append(rect)
        else:
            msg.exists.append(False)
            msg.object_rect.append(None)

    return msg

def main():
    objectmatching = TemplateMatching()
    name_objects = object_matching.get_name_objects()
    pub_object_status = rospy.Publisher("object_status", ObjectStatus, queue_size=10)
    time.sleep(1)

    while True:

        if color_img is None:
            continue

        exists_objects_name, dict_box_objects = objectmatching.\
                check_multi_objects_in_image(color_image)
        msg = create_obj_status(name_objects, exists_objects_name, dict_box_objects)
        pub_object_status.publish(msg)
        rospy.spinOnce()


if __name__=="__main__":
    main()
