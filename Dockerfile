FROM ubuntu:14.04
MAINTAINER John-Paul Stanford <dev@stanwood.org.uk>

VOLUME /tmp

RUN apt-get update -y && \
    apt-get install -y software-properties-common python-software-properties
    
RUN add-apt-repository -y ppa:ubuntu-wine/ppa && \
    apt-get update -y

RUN dpkg --add-architecture i386 && apt-get update -y && apt-get install -y wine1.7 winetricks xvfb
    
#RUN apt-get purge -y python-software-properties && \
#    apt-get autoclean -y
   
# Download itunes 12 64 Bit
# wget -O /tmp/itunes.exe https://secure-appldnld.apple.com/iTunes12/031-08059.20141016.FrPFF/iTunes64Setup.exe
# Download itunes 12 32 Bit
# wget -O /tmp/itunes-installer.exe https://secure-appldnld.apple.com/iTunes12/031-08058.20141016.34epp/iTunesSetup.exe

RUN apt-get install -y p7zip-full 

ENV WINEPREFIX /windows
ADD ./iTunesSetup.exe /tmp/itunes-installer.exe
RUN mkdir /tmp/extracted && \
    cd /tmp/extracted && \
    7z e /tmp/itunes-installer.exe && \
    mkdir -p /windows/drive_c && \
    mv /tmp/extracted/* /windows/drive_c/

#RUN rm -rf /tmp/extracted

RUN wine msiexec /i c:/AppleApplicationSupport.msi /qn

#RUN wine /tmp/itunes.exe

#RUN winetricks riched20

CMD /usr/bin/itunes.sh