#!/bin/sh
echo "+++++++++++++++++++STARTING PIPELINES+++++++++++++++++++"

echo "Checking the configurations"
if [[ -z "$INPUT_HOST" || -z "$INPUT_USERNAME" ]] ; then
    echo "No Host found to connect"
    echo "Exiting the Application"
    echo "Trying uppercase"
    echo $INPUT_HOST
    echo "printing User"
    echo $INPUT_USERNAME
fi
echo ""

echo "Setting up the SSH folders"
mkdir ~/.ssh/ && chmod 0700 ~/.ssh/
ssh-keyscan github.com > ~/.ssh/known_hosts
echo ""

echo "Setting up the public, private keys and Executables"
echo $INPUT_KEY > ~/.ssh/id_rsa && echo $INPUT_PUB > ~/.ssh/id_rsa.pub
chmod 600 ~/.ssh/id_rsa && chmod 600 ~/.ssh/id_rsa.pub
touch /scp-deployer.sh && chmod 700 /scp-deployer.sh
echo ""
echo "+++++++++++++++++++END PIPELINES+++++++++++++++++++"
