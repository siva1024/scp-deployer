#!/bin/sh
echo "+++++++++++++++++++STARTING PIPELINES+++++++++++++++++++"

echo "Checking the configurations"
if [[ -z "$INPUT_HOST" || -z "$INPUT_USERNAME" ]] ; then
    echo "No Host found to connect"
    echo "Exiting the Application"
    exit 1
fi
echo ""


echo "Setting up the SSH folders"
mkdir ~/.ssh/ && chmod 0700 ~/.ssh/
ssh-keyscan github.com > ~/.ssh/known_hosts
ssh-keyscan $INPUT_HOST >> ~/.ssh/known_hosts
cat ~/.ssh/known_hosts
echo ""


echo "Setting up the public, private keys and Executables"
echo $INPUT_KEY > ~/.ssh/id_rsa && echo $INPUT_PUB > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa.pub
touch /scp-deployer.sh && chmod 700 /scp-deployer.sh
echo ""


echo "Starting the SCP between local and remote"
echo $INPUT_SOURCE

echo "+++++++++++++++++++END PIPELINES+++++++++++++++++++"
