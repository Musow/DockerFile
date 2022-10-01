FROM ubuntu:20.04
RUN apt install libgl1 wget git 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/miniconda3
ENV PATH="/opt/miniconda3/bin:$PATH"
RUN conda install mamba -n base -c conda-forge
RUN mamba create -n yolov7 python=3.9 opencv -y
RUN conda activate yolov7
RUN git clone -b pose --single-branch https://github.com/WongKinYiu/yolov7.git
RUN cd yolov7
RUN pip install -r requirement.txt