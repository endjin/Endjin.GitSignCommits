#!/bin/bash

GREEN='\033[0;32m'
NOCOLOUR='\033[0m'

echo -e "${GREEN}--------"
echo "To generate a key using the default settings:" 
echo "Select 1 for the first option"
echo "For key size enter 4096"
echo "For how long the key should last should be 0"
echo "And then verify by entering y"
echo -e "--------${NOCOLOUR}"
gpg --full-generate-key
DATENOW="$(date +'%Y-%m-%d')"
KEYID=$(gpg --list-secret-keys --keyid-format=long | grep -oP "(?<=\/)(.*?)(?= ${DATENOW} \[SC])" | head -1)
echo -e "${GREEN} This is your key ID: ${NOCOLOUR}"
echo $KEYID
gpg --armor --export $KEYID
gpg --export --armor $KEYID > ./gpg-key.pub
echo -e "${GREEN}--------"
echo "Now copy this public key"
echo "Go to settings in GitHub and click 'GPG and SSH Keys'"
echo "Paste as a new GPG key"
echo -e "--------${NOCOLOUR}"
start https://github.com/settings/keys
echo "Type any message below once you have set up your GPG key in Github to continue: "
read message
echo "Enter the user name you want to use to sign your commits:"
read username
git config --global user.name ${username}
echo "Enter the user email you want to use to sign your commits:"
read useremail
git config --global user.email ${useremail}
git config --global user.signingkey ${KEYID}
git config --global commit.gpgsign true
git config --global gpg.program gpg
