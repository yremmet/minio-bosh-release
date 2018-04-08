#!/bin/bash

if [ -z "$BOSH_ENVIRONMENT" ]; then
    export BOSH_ENVIRONMEN="vcap"
    echo $BOSH_ENVIRONMENT
fi

bosh create-release --force
bosh upload-release 
