#!/bin/bash

# Exit on any error
set -e

# Check for required environment variables
if [[ -z "$HUGO_BUCKET_NAME" || -z "$HUGO_DIST_ID" ]]; then
  echo "Missing environment variables."
  echo "Please set HUGO_BUCKET_NAME and HUGO_DIST_ID before running this script."
  exit 1
fi

echo "Building Hugo site..."
hugo

echo "Syncing to S3 bucket: $HUGO_BUCKET_NAME"
aws s3 sync public/ s3://$HUGO_BUCKET_NAME --delete

echo "Creating CloudFront invalidation..."
aws cloudfront create-invalidation --distribution-id "$HUGO_DIST_ID" --paths "/*"

echo "Deployment complete!"
