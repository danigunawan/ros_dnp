1. Collect data for multiple object, using command: python3 collect_data_with_drag_and_crop.py --raw_img_dir=pink_bottle --cropped_img_dir=pink_bottle 
raw_image_dir is place for saving image raw data for pink bottle object. cropped_img_dir is place for saving image cropped data for pink bottle object
You need to run number command equal number of object you have with different name.

2. Choose box for putting object in it python3 choosing_place_for_object.py --file_coord_name=pink_bottle.txt
You need to run number command equal number of object you have with different name.

(optional)3. Run for testing python3 object_template_matching.py. Box's color is blue if existing object in, otherwise box's color is green
4.
Run source setup.bash
Run python3 human_skeleton.py for testing combination of object matching and knocking detecting and smelling detection
