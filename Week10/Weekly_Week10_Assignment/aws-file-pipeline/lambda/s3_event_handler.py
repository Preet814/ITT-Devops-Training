import json
import logging
from utils.s3_helper import publish_sns
from utils.sqs_helper import SQSHandler

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)

# Constants for SQS and SNS
sqs_queue_url = "https://sqs.ap-south-1.amazonaws.com/867344449786/triggerQueueOnUpload"
sns_topic_arn = "arn:aws:sns:ap-south-1:867344449786:triggerOnUpload"


def lambda_handler(event, context):
    try:
        logger.info("Received event: %s", json.dumps(event))

        # Extract S3 bucket and object key from the event
        records = event["Records"]
        bucket = records[0]["s3"]["bucket"]["name"]
        key = records[0]["s3"]["object"]["key"]

        logger.info("Processing file from bucket: %s, key: %s", bucket, key)

        # Publish a message to SNS
        try:
            message = publish_sns(bucket, key, sns_topic_arn)
            logger.info("Published message to SNS: %s", message)
        except Exception as sns_err:
            logger.error("Error publishing to SNS: %s", str(sns_err))
            raise

        # Send a message to SQS using the helper class
        try:
            sqs = SQSHandler(sqs_queue_url)
            sqs.send_message(bucket, key, message)
            logger.info("Sent message to SQS queue: %s", sqs_queue_url)
        except Exception as sqs_err:
            logger.error("Error sending message to SQS: %s", str(sqs_err))
            raise

        return {"statusCode": 200, "body": json.dumps("Message sent via SNS & SQS.")}

    except Exception as e:
        logger.exception("Error in lambda_handler: %s", str(e))
        return {"statusCode": 500, "body": json.dumps("Internal server error")}
