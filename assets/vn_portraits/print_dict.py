import os
for filename in os.listdir("."):
    if filename.endswith(".png"):
    	name = filename[:-4]
    	print('\"{}\": preload(\"res://assets/vn_portraits/{}\"),'.format(name, filename))