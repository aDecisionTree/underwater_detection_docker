#!/bin/bash
python demo.py --net vgg16 --checksession 1 --checkepoch 20 --checkpoint 1991 --cuda True --load_dir . \
               --image_dir  $1 \
               --output_dir $2
