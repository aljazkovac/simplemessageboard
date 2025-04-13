#!/bin/sh
GITHUB_REPO="https://github.com/"$1.git
DOCKER_HUB_REPO=$2

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