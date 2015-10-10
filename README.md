Shell Scripts
=============

## Introduction
This repository will hold a collection of custom scripts


## AlsaRestartOnHDMIChange
This script is triggered by a udev event when there is a change in the drm
subsystem. Since alsa restart needs super user permissions, it is necesary to
add the NOPASSWD rule for this script using visudo. The script also softlinks
two custom .asoundrc config file based on HDMI state. The build in speakers
would be the deault audio source if you use the .asoundrc refered to by the
master branch of the submodule. The HDMIConfig branch implement softvol and
makes HDMI as the default audio source.
 
