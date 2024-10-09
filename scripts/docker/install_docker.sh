#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/; then
    echo "Docker is not installed. Installing Docker..."

    sudo apt-get remove -y \
        docker.io \
        docker-doc \
        docker-compose \
        docker-compose-v2 \
        podman-docker \
        containerd \
        runc

    if ! command -v curl &> /dev/null; then
        echo "curl could not be found, installing..."
        sudo apt-get update
        sudo apt-get install -y curl
    else
        echo "curl is already installed"
    fi

    sudo apt-get install -y ca-certificates software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    
    sudo apt-get install -y docker-ce

    sudo groupadd docker
    sudo usermod -aG docker $USER
    
    # Verify Docker installation
    if command -v docker &> /dev/null; then
        echo "Docker installed successfully."
    else
        echo "Docker installation failed."
    fi
else
    echo "Docker is already installed."
fi
