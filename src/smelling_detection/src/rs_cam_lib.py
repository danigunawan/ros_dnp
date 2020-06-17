# Library using camera realsense. 
# Reference align depth to Color: https://github.com/IntelRealSense/librealsense/blob/master/wrappers/python/examples/align-depth2color.py
import pyrealsense2 as rs
import numpy as np

class RealSense(object):

    def __init__(self, file_bag=None):
        self.pipeline = rs.pipeline()

        config = rs.config()
        if file_bag is not None:
            rs.config.enable_device_from_file(config, file_bag)

        config.enable_stream(rs.stream.depth, 640, 480, rs.format.z16, 30)
        config.enable_stream(rs.stream.color, 640, 480, rs.format.bgr8, 30)

        self.profile = self.pipeline.start(config)
        self.depth_sensor = self.profile.get_device().first_depth_sensor()
        self.depth_scale = self.depth_sensor.get_depth_scale()

        self.clipping_distance_in_meters = 1
        self.clipping_distance = self.clipping_distance_in_meters / self.depth_scale
        
        align_to = rs.stream.color
        self.align = rs.align(align_to)

    def get_aligned_frame(self):

        return self.align.process(self.pipeline.wait_for_frames())

    def get_depth_rect(self, depth, tl, br):
        
        sum_dist = num_dist = 0
        
        for x in range(tl[0], br[0]):
            for y in range(tl[1], br[1]):
                dist = depth.get_distance(x, y) 

                sum_dist += dist
                num_dist += 1

        return sum_dist / num_dist

    def get_depth_around_point(self, depth, point, threshold_around=5):
        tl = (point[0]-threshold_around, point[1]-threshold_around)
        br = (point[0]+threshold_around, point[1]+threshold_around)
        #Should check condition tl and br be inside image.

        return self.get_depth_rect(depth, tl, br)
