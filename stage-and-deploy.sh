#!/bin/bash

manifest="manifests/manifest-dev-example.yaml"
$(dirname $0)/staging.sh

name=$(bosh int $manifest --path /name)


bosh deploy -d $name $manifest -n \
  -v minio_region=local \
  -v minio_access_key=local \
  -v minio_secret_key=local123

bosh run-errand -d $name  minio-smoke-test
