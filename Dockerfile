From pytorch/pytorch:1.5-cuda10.1-cudnn7-devel
WORKDIR /
CMD /bin/bash
RUN echo "deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" >/etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse" >>/etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse" >>/etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse" >> /etc/apt/sources.list
RUN apt-get update && \
 apt-get install -y wget zip g++ libsm6 libxrender1 libglib2.0-dev libxext-dev libjpeg-dev libpng-dev && \
 wget https://github.com/aDecisionTree/CVPR2020UG2code/releases/download/v1/underwater_detect_new.zip && \
 unzip underwater_detect_new.zip && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ scipy==1.0 && \
 cd /lib && \
 python setup.py build develop && \
 wget -P /vgg16/pascal_voc/ https://gaopursuit.oss-cn-beijing.aliyuncs.com/202004/faster_rcnn_1_20_1991.pth
COPY run.sh /
