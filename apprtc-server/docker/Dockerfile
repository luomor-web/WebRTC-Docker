FROM piasy/apprtc-server

WORKDIR apprtc
COPY js/appcontroller.js /apprtc/src/web_app/js/appcontroller.js
RUN grunt build

WORKDIR /
RUN mkdir /log
RUN mkdir /var/log/turn

COPY run.sh /
RUN chmod +x /run.sh
CMD /run.sh
