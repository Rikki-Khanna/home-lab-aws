FROM ubuntu:22.04

MAINTAINER RAVI.KHANNA RIKKIKHANNA20@GMAIL.COM

RUN apt-get -y update && apt-get -y upgrade && apt-get install -y build-essential 

RUN apt-get install -y curl iproute2 sshfs unzip less groff

RUN curl -LO https://dl.k8s.io/release/v1.23.6/bin/linux/amd64/kubectl &&  chmod +x kubectl && mv kubectl /usr/local/bin

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install && rm -rf awscliv2.zip aws

ENV PATH="${PATH}:/usr/local/bin"

CMD ["/bin/bash"]