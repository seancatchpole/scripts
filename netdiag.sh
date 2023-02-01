#!/bin/bash

user=$(whoami)
output=/home/$user/netdiag_output.txt

exec > >(tee netdiag_output.txt) 2>&1

ifconfig 
echo '--------------------------------------------------------------------'
dig google.com 
echo '--------------------------------------------------------------------'
nslookup google.com 
echo '--------------------------------------------------------------------'
ping -c 4 1.1.1.1 
echo '--------------------------------------------------------------------'

curl --upload-file netdiag_output.txt 'https://paste.c-net.org/'
