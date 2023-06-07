FROM piasy/apprtc-server

WORKDIR apprtc
COPY js/appcontroller.js /apprtc/src/web_app/js/appcontroller.js
RUN grunt build

WORKDIR /

COPY run.sh /
RUN chmod +x /run.sh
CMD /run.sh
