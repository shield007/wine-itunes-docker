# iTunes using wine

This a docker application used to run Apple iTunes with the use of wine. It's expermiental so use at your own risk.

To run the image, type:
 
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix