#!/bin/bash

# Check if Docker is installed
if command -v docker &> /dev/null; then
    echo "Docker is installed. Removing Docker..."

    sudo apt-get remove -y \
        docker.io \
        docker-doc \
        docker-compose \
        docker-compose-v2 \
        podman-docker \
        containerd \
        runc \
        docker-ce

    sudo apt-get purge -y \
        docker-ce \
        docker-ce-cli \
        containerd.io \
        docker-buildx-plugin \
        docker-compose-plugin \
        docker-ce-rootless-extras

    sudo apt-get update
    sudo apt-get autoremove -y

    # Verify Docker installation
    if ! command -v docker &> /dev/null
    then
        echo "Docker removed successfully."
    else
        echo "Docker removal failed."
    fi
else
    echo "Docker is already removed."
fi
