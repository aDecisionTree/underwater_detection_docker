FROM python:3.6.9-slim
CMD /bin/bash
RUN echo "deb http://mirrors.aliyun.com/debian/ buster main contrib non-free" >/etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list&&\
echo "deb http://mirrors.aliyun.com/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/debian/ buster main contrib non-free" >>/etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/debian/ buster-updates main contrib non-free" >> /etc/apt/sources.list&&\
echo "deb-src http://mirrors.aliyun.com/debian/ buster-backports main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update && apt-get install -y wget zip g++ &&\
 wget https://gaopursuit.oss-cn-beijing.aliyuncs.com/202004/underwater_detect.zip && \
 unzip underwater_detect.zip && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ --upgrade pip && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ -r requirements.txt && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ scipy==1.0 && \
 pip install -i https://mirrors.aliyun.com/pypi/simple/ torch torchvision &&\
# WORKDIR ./lib
RUN cd /lib && python setup.py build develop
# WORKDIR /
RUN wget -P /vgg16/pascal_voc/ https://gaopursuit.oss-cn-beijing.aliyuncs.com/202004/faster_rcnn_1_20_1991.pth
COPY run.sh /
