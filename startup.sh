curl -Lf# https://github.com/homebridge/ffmpeg-for-homebridge/releases/latest/download/ffmpeg-debian-$(uname -m).tar.gz | sudo tar xzf - -C / --no-same-owner
npm install -g homebridge-camera-ffmpeg@1.2.2
npm install -g homebridge-http-securitysystem@1.0.8
npm install -g homebridge-http-contact-sensor@1.0.3
npm install -g homebridge-http-pir-motion-sensor@1.0.0