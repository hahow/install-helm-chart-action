#!/usr/bin/env bash

set -exu

gcloud_key_file="./gcloud-auth-key.json"
echo "${INPUT_GCLOUD_AUTH_KEY}" > "${gcloud_key_file}"
gcloud auth activate-service-account --key-file="${gcloud_key_file}"
gcloud config set project "${INPUT_GCLOUD_PROJECT_ID}"
gcloud container clusters get-credentials "${INPUT_CLUSTER_NAME}" --region "${INPUT_CLUSTER_REGION}"

helm upgrade ${INPUT_RELEASE_NAME} ${INPUT_CHART_NAME} \
    --namespace "${INPUT_RELEASE_NAMESPACE}" \
    ${INPUT_HELM_UPGRADE_ARGS} \
    --install
