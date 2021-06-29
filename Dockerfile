FROM ubuntu:20.04

RUN ln -snf /usr/share/zoneinfo/$CONTAINER_TIMEZONE /etc/localtime && echo $CONTAINER_TIMEZONE > /etc/timezone

RUN apt-get update && apt-get install -y libsodium-dev libgmp3-dev cmake g++ git

RUN git clone https://github.com/madMAx43v3r/chia-plotter.git /root/chia-plotter

RUN cd /root/chia-plotter && git submodule update --init && bash make_devel.sh

COPY plotter.sh /root/

CMD bash /root/plotter.sh $FARMERKEY $POOLKEY
