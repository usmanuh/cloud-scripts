#!/bin/bash

# Exit if any command fails
set -e

# Define variables
BUCKET_NAME="your-s3-bucket-name"
DIST_ID="your-cloudfront-distribution-id"

echo " Building Hugo site..."
hugo

echo " Syncing to S3..."
aws s3 sync public/ s3://$BUCKET_NAME --delete

echo " Creating CloudFront invalidation..."
aws cloudfront create-invalidation --distribution-id $DIST_ID --paths "/*"

echo " Deployment complete!"
