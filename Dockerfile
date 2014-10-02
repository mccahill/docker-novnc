# mccahill/novnc
#
# VERSION               0.1

FROM ubuntu:trusty
MAINTAINER Mark McCahill "mark.mccahill@duke.edu"

RUN apt-get update -y
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y git x11vnc wget python python-numpy unzip Xvfb firefox openbox geany
RUN apt-get install -y libreoffice-base libreoffice-gtk libreoffice-calc

# add a non-root user so we can log in as that user
RUN (adduser --disabled-password --gecos "" guest && echo "guest:guest"|chpasswd)
RUN mkdir ~guest/.config; mkdir ~guest/.config/openbox
RUN cp /etc/xdg/openbox/menu.xml ~guest/.config/openbox/menu.xml

# store a password for the VNC service
RUN mkdir ~root/.vnc
RUN x11vnc -storepasswd badpassword ~root/.vnc/passwd

RUN cd /root && git clone https://github.com/kanaka/noVNC.git 
ADD startup.sh /startup.sh
RUN chmod 0755 /startup.sh
CMD /startup.sh
EXPOSE 6080 
