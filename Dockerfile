FROM node:6.9.2
MAINTAINER Pointlook Admin "admin@pointlook.com"

ARG NODE_ENV
ENV NODE_ENV $NODE_ENV

RUN /usr/sbin/useradd -d /home/web -m web
RUN /bin/rm -rf /home/web

RUN /usr/bin/git clone https://github.com/users-pl/www.git /home/web
RUN ( cd /home/web;/bin/rm -rf app )
RUN /usr/bin/git clone https://github.com/dev-pl/login-server.git /home/web/app

RUN ( cd /home/web/app;npm install )
RUN cd /home;/bin/chown -R web: web

EXPOSE 3000
WORKDIR /home/web/app
VOLUME /home/web/app

CMD [ "npm", "start" ]
