#!/bin/bash

LAYOUTROOT=/home/dan/dev/web/.layouts

layoutName=$1
projectName=$2

[ -n "$layoutName" -a -n "${projectName}" -a -d "${LAYOUTROOT}/${layoutName}" ] && (
  layout="${LAYOUTROOT}/${layoutName}"
  echo "Templating from ${layout}"
  
  cp -ar "${layout}" .
  mv "${layoutName}" "${projectName}"

  cd "${projectName}"
  renameRegex="'s/${layoutName}/${projectName}/'"
  renameCmd="find . -name \"*${layoutName}*\" -exec rename $renameRegex {} \;"
  eval $renameCmd
)
