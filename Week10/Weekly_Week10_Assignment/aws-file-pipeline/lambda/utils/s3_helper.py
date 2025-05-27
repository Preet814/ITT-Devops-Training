import boto3
import logging
from botocore.exceptions import ClientError

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Initialize AWS clients
s3_client = boto3.client("s3")
sns_client = boto3.client("sns")


def publish_sns(bucket, key, topic_arn):
    """
    Publishes a message to the specified SNS topic when a ZIP file is uploaded to S3.
    """
    message = f"Zip file - {key} uploaded successfully to {bucket}"
    try:
        response = sns_client.publish(
            TopicArn=topic_arn, Message=message, Subject="S3 ZIP Upload Notification"
        )
        logger.info("SNS publish response: %s", response)
        return message
    except ClientError as e:
        logger.error("Failed to publish message to SNS: %s", e)
        raise


def download_file_from_s3(bucket, key, download_path):
    """
    Downloads a file from S3 to the specified local path.
    """
    try:
        s3_client.download_file(bucket, key, download_path)
        logger.info("Downloaded %s from bucket %s to %s", key, bucket, download_path)
    except ClientError as e:
        logger.error("Failed to download file from S3: %s", e)
        raise


def upload_file_to_s3(file_path, bucket, key):
    """
    Uploads a file from local path to the specified S3 bucket and key.
    """
    try:
        s3_client.upload_file(file_path, bucket, key)
        logger.info("Uploaded %s to bucket %s as %s", file_path, bucket, key)
    except ClientError as e:
        logger.error("Failed to upload file to S3: %s", e)
        raise
