#!/usr/bin/bash
# checkout https://cloud.google.com/python/docs/setup

export PS1="$ "
python -m venv env
source env/bin/activate
pip install google-cloud-storage


xport PROJECT=$(gcloud config get-value project)
export REGION=us-east1



#Setup Topics 
export GCS_NOTIFICATION_TOPIC="gcs-notification-topic"
gcloud pubsub topics create ${GCS_NOTIFICATION_TOPIC}

export  GCS_NOTIFICATION_SUBSCRIPTION="gcs-notification-subscription"
gcloud pubsub subscriptions create  ${GCS_NOTIFICATION_SUBSCRIPTION}  --topic=${GCS_NOTIFICATION_TOPIC}


export IMAGE_BUCKET=${PROJECT}-images
gsutil mb -c standard -l ${REGION} gs://${IMAGE_BUCKET}
