#!/bin/bash
sudo add-apt-repository ppa:rvm/smplayer 
sudo apt-get update
sudo apt-get install smplayer smtube smplayer-themes smplayer-skins -y

sudo add-apt-repository ppa:banshee-team/ppa
sudo apt-get update
sudo apt-get install banshee -y