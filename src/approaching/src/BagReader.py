import pyrealsense2 as rs
import numpy as np
import cv2
import math

class BagFileReader(object):

    def __init__(self, path_bag, wcolor, hcolor, wdepth, hdepth, colorrate, depthrate):

        self.pipeline = rs.pipeline()
        config = rs.config()
        if path_bag is not None: 
            print("Getting from bag file {}".format(path_bag))
            rs.config.enable_device_from_file(config, path_bag)
        self.wcolor = wcolor
        self.hcolor = hcolor 
        self.wdepth = wdepth
        self.hdepth = hdepth
        config.enable_stream(rs.stream.color, self.wcolor, self.hcolor, rs.format.rgb8, colorrate)
        config.enable_stream(rs.stream.depth, self.wdepth, self.hdepth, rs.format.z16, depthrate)
        profile = self.pipeline.start(config)

        depth_sensor = profile.get_device().first_depth_sensor()
        depth_scale = depth_sensor.get_depth_scale()

        clipping_distance_in_meters = 1 #1 meter
        clipping_distance = clipping_distance_in_meters / depth_scale

        align_to = rs.stream.color
        self.align = rs.align(align_to)

    def get_color_frame(self):

        frames = self.pipeline.wait_for_frames()
        aligned_frames = self.align.process(frames)

        aligned_depth_frame = aligned_frames.get_depth_frame()
        color_frame = aligned_frames.get_color_frame()
        color_image = np.asarray(color_frame.get_data())
        color_image = cv2.cvtColor(color_image,cv2.COLOR_BGR2RGB)

        return color_image
    
    def get_color_shape(self):
        return self.hcolor, self.wcolor

    def get_depth_color_frame(self):

        frames = self.pipeline.wait_for_frames()
        aligned_frames = self.align.process(frames)
        color_frame = aligned_frames.get_color_frame()
        depth_frame = aligned_frames.get_depth_frame()

        return color_frame, depth_frame
    
    def convert_color_frame_to_array(self, color_frame):
        return np.asanyarray(color_frame.get_data())

    def calculate_distance(self, ix, iy, x, y, color_frame, depth_frame):

        color_intrin = color_frame.profile.as_video_stream_profile().intrinsics
        udist = depth_frame.get_distance(ix,iy)
        vdist = depth_frame.get_distance(x, y)
        #print udist,vdist

        point1 = rs.rs2_deproject_pixel_to_point(color_intrin, [ix, iy], udist)
        point2 = rs.rs2_deproject_pixel_to_point(color_intrin, [x, y], vdist)
        #print str(point1)+str(point2)

        dist = math.sqrt(math.pow(point1[0] - point2[0], 2) + math.pow(point1[1] - point2[1],2) + math.pow(point1[2] - point2[2], 2))
        #print 'distance: '+ str(dist)
        return dist

