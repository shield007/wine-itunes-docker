FROM ubuntu:14.04
MAINTAINER John-Paul Stanford <dev@stanwood.org.uk>

VOLUME /tmp

RUN apt-get update -y && \
    apt-get install -y python-software-properties
    
RUN add-apt-repository -y ppa:ubuntu-wine/ppa && \
    apt-get update -y

RUN apt-get install -y wine1.7 winetricks xvfb
    
#RUN apt-get purge -y python-software-properties && \
#    apt-get autoclean -y
   
# Download itunes 12 64 Bit
wget -O /tmp/itunes.exe https://secure-appldnld.apple.com/iTunes12/031-08059.20141016.FrPFF/iTunes64Setup.exe

RUN wine /tmp/itunes.exe

CMD /usr/bin/itunes.sh