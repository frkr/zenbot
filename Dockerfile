FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get install wget jq curl python2 git build-essential mongodb -y

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install nodejs

RUN cd /opt && git clone https://github.com/deviavir/zenbot.git
RUN cd /opt/zenbot && npm install

VOLUME /data/db

WORKDIR /opt/zenbot
RUN cp zenbot.sh /bin/zenbot
RUN chmod +x /bin/zenbot

COPY stop.sh .
COPY README.md .
COPY start.sh .
CMD ./start.sh
