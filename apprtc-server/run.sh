sed -i "s/SERVER_PUBLIC_IP/${PUBLIC_IP}/g" /ice.js
#sed -i 's/wss:\/\//ws:\/\//g' /apprtc/out/app_engine/apprtc.py
#sed -i 's/https:\/\//http:\/\//g' /apprtc/out/app_engine/apprtc.py

#sed -i "s/SERVER_PUBLIC_IP/${PUBLIC_IP}/g" /apprtc/out/app_engine/constants.py
cp /apprtc_configs/constants.py /apprtc/out/app_engine/constants.py

echo 'log-file=/var/log/turn/turn.log' >> /etc/turnserver.conf

nodejs ice.js 2>> /log/iceconfig.log &

$GOPATH/bin/collidermain -port=8089 -tls=false --room-server=0.0.0.0 2>> /log/collider.log &
dev_appserver.py /apprtc/out/app_engine --skip_sdk_update_check --enable_host_checking=False --host=0.0.0.0 2>> /log/room_server.log &

turnserver -v -L 0.0.0.0 -a -f -r apprtc -c /etc/turnserver.conf --no-tls --no-dtls