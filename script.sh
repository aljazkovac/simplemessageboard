#!/bin/sh
GITHUB_REPO="https://github.com/"$1.git
DOCKER_HUB_REPO=$2

if [ -n "$DOCKER_USER" ] && [ -n "DOCKER_PWD" ]; then
    echo "Logging in to Docker Hub"
    echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
fi

echo "Cloning repository:" $GITHUB_REPO
git clone $GITHUB_REPO repo_dir
cd repo_dir

echo "Building Docker image"
docker build . -t $DOCKER_HUB_REPO

echo "Pushing image to Docker Hub"
docker push $DOCKER_HUB_REPO

cd ..
rm -rf repo_dir

echo "Done!"