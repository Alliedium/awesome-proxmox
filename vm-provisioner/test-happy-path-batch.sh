#!/bin/bash
set -e
set -a;source ./.env.example;set +a
./download-cloud-init-images.sh
./batch-stop-destroy.sh
./batch-create-start.sh
./batch-stop-destroy.sh
