FROM debian:buster
RUN dpkg --add-architecture i386
RUN sed -i 's/ main/ main contrib/' /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install --no-install-recommends -y \
    wine32 \
    ca-certificates \
    winetricks \
    xvfb \
    xauth \
 && rm -rf /var/lib/apt/lists/*
RUN useradd --create-home -s /bin/bash wine_user
WORKDIR /home/wine_user
USER wine_user
RUN winetricks --unattended nocrashdialog
RUN winetricks --unattended dotnet472
