import boto3
import json
import logging
from botocore.exceptions import ClientError

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


class SQSBase:
    def __init__(self, queue_url):
        """
        Initializes the base class with the SQS queue URL and client.
        """
        self.queue_url = queue_url
        self.sqs_client = boto3.client("sqs")


class SQSHandler(SQSBase):
    def send_message(self, bucket, key, message):
        """
        Sends a message to the SQS queue with bucket, key, and custom message details.
        """
        body = json.dumps({"bucket": bucket, "key": key, "message": message})

        try:
            response = self.sqs_client.send_message(
                QueueUrl=self.queue_url, MessageBody=body
            )
            logger.info("Message sent to SQS. MessageId: %s", response.get("MessageId"))
            return response
        except ClientError as e:
            logger.error("Failed to send message to SQS: %s", e)
            raise
