FROM node
MAINTAINER Chyld Medford <chyld.medford@gmail.com>

RUN apt-get update && apt-get install -y supervisor
RUN useradd edon -m -s /bin/bash
COPY docker/supervisor-node.conf /etc/supervisor/conf.d/
COPY package.json /src/
COPY app /src/app/
RUN chown -R edon:edon /src

ENV REFRESHED_AT 2015-09-01
ENV A Hello
ENV PORT 5000

USER edon
WORKDIR /src
RUN npm install

USER root
EXPOSE $PORT
EXPOSE 9999
CMD ["/usr/bin/supervisord"]
