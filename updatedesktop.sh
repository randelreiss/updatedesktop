#!/bin/bash
screen_width=1280 #<--set here your screen's width dimension
interval="420" #<--set here the seconds you want to sleep till the next update

echo "Update Background SHELL"

# Wait till you have internet connection
while ! ping -c 1 google.com > /dev/null 2> /dev/null; do
  echo "Waiting for internet connection..."
  sleep 3
done

while true; do
   echo "Screenshot webpage..."
   gnome-web-photo --delay=3 --timeout=59 --mode=photo --width=1024 "https://radar.weather.gov/radar.php?rid=rtx&product=N0R&overlay=11001111&loop=no&Counties=0" $HOME/Documents/web_image/NOAA_RADAR_PDX.png
   # Crop the image
   echo "Crop screenshot..."
   convert $HOME/Documents/web_image/NOAA_RADAR_PDX.png -crop 257x145+398+550 -resize x800 $HOME/Documents/web_image/NOAA_RADAR_EUG.png
   # gsettings set org.gnome.desktop.background picture-uri 'file://$HOME/Documents/web_image/output2.png'
   # **** Aiming desktop background setting to the file seems to update
   echo "Sleeping $interval seconds till the next update..."
   sleep $interval
done
