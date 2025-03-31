#FROM alpine:3.21.3
FROM buildpack-deps:bookworm


RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install python3-pip unzip sshpass python3-venv net-tools iputils-ping
RUN python3 -m venv --upgrade-deps ~/venv
COPY install.sh /root/
RUN /root/install.sh
#COPY .bash_profile /root/
COPY .bash_profile /root/.bashrc

