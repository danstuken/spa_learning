#!/bin/bash

if [ "$(id -u)" -ne "0" ]; then 
  echo "you must be root to deploy".
  exit -1
fi

ROOT=/home/dan/dev/web
DEPLOYROOT=/var/www/spas
sitename=$1

[ -n "$sitename" -a -d "${ROOT}/${sitename}" ] && (
  deploysite="${ROOT}/${sitename}"
  deploytarget="${DEPLOYROOT}/${sitename}"
  echo "Deploying: $deploysite -> $deploytarget"

  [ -d "${deploytarget}" ] || (
    mkdir "${deploytarget}"
  )

  cd "${deploysite}"
  cp -avf * "${deploytarget}"
)
