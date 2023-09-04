#!/bin/bash

# Check if the BITBUCKET_REPO_URL variable is set
if [ -z "${BITBUCKET_REPO_URL}" ]; then
    echo "Error: BITBUCKET_REPO_URL environment variable is not set. Edit your ~/.bashrc accordingly!!"
    exit 1
fi

# Get the latest commit hash from the Git repository
COMMIT_HASH=$(git ls-remote ${BITBUCKET_REPO_URL} | head -1 | awk '{print $1;}')

# Check if the COMMIT_HASH variable is empty
if [ -z "${COMMIT_HASH}" ]; then
    echo "Error: Failed to retrieve the latest commit hash."
    exit 1
fi

# # Install the package
python -m pip install git+${BITBUCKET_REPO_URL}@${COMMIT_HASH}
