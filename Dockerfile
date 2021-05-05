FROM ubuntu:20.04
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update \
    && apt-get install wget jq curl python2 git build-essential mongodb -y \
    && apt-get clean -y \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

VOLUME /data/db

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt install nodejs

RUN cd /opt && git clone https://github.com/deviavir/zenbot.git
RUN cd /opt/zenbot && npm install && npm cache clean --force

WORKDIR /opt/zenbot
RUN cp zenbot.sh /bin/zenbot
RUN chmod +x /bin/zenbot

COPY mongodb.sh .
COPY stop.sh .
COPY README.md .
COPY sim.sh .
COPY start.sh .
RUN chmod +x *.sh
CMD ./sim.sh
