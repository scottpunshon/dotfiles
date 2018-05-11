#!/usr/bin/env bash

project=${1:new-project}
username=${2:-$USER}
username=${2:-scottpunshon}

#curl -k -X POST --user user:pass "https://api.bitbucket.org/1.0/repositories" -d "name=project_name"
curl -k -X POST --user ${username} -p "https://api.bitbucket.org/1.0/repositories" -d "name=${project}"

