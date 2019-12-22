#!/bin/sh -l

set -e

if [ -z "$FIREBASE_TOKEN" ]; then
  echo "FIREBASE_TOKEN is required to run commands with the firebase cli"
  exit 126
fi

sh -c "firebase $*"
