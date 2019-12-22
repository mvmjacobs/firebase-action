#!/bin/sh -l

set -e

if [ -z "$GITHUB_FIREBASE_TOKEN" ]; then
  echo "GITHUB_FIREBASE_TOKEN is required to run commands with the firebase cli"
  exit 126
fi

sh -c "firebase $*"
