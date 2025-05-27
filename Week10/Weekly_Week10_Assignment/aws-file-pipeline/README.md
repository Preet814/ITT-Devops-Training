# AWS S3 Zip File Processor using Lambda, SQS, and SNS

This project implements a file processing pipeline using AWS services. It is designed to:

- Detect `.zip` file uploads in an S3 bucket
- Trigger a Lambda function to notify via SNS and queue a message into SQS
- Trigger a second Lambda via SQS, which downloads, extracts, converts `.txt` and `.json` files inside the zip to `.csv`, zips them, and uploads to another S3 bucket

---

## Folder Structure

aws-file-pipeline/
├── lambda/
│ ├── s3_event_handler.py # Lambda 1: S3 trigger → SNS + SQS
│ ├── sqs_processor.py # Lambda 2: SQS trigger → process & upload
│ └── utils/
│ ├── sqs_helper.py # (Optional) reusable SQS helper
│ └── s3_helper.py # Helper for downloading/uploading from S3
├── requirements.txt # Python dependencies
├── README.md # Project explanation


---

## 🛠 Setup Instructions

### 1. **Manual AWS Setup**

- **Input S3 bucket** (e.g., `demo-input-s3-bucket-itt-1`)
- **Output S3 bucket** (e.g., `demo-output-s3-bucket-itt-1`)
- **SNS topic** (e.g., `triggerOnUpload`)
- **SQS queue** (e.g., `triggerQueueOnUpload`)
- **Event Notification** on input bucket to trigger Lambda 1 on `.zip` file upload

### 2. **Lambda 1 – `s3_event_handler.py`**
Triggered when a `.zip` is uploaded to input bucket.

- Publishes message to SNS (for notification)
- Sends a message with `bucket` and `key` to SQS (for processing)

### 3. **Lambda 2 – `sqs_processor.py`**
Triggered by messages from SQS.

- Downloads the uploaded zip from input bucket
- Extracts the zip into `/tmp`
- Converts any `.txt` or `.json` files into `.csv`
- Zips the converted `.csv` files
- Uploads the final zip to the output bucket

---

## 🔧 Dependencies

Make sure the Lambda deployment package includes `boto3` . Use:

```bash
pip install -r requirements.txt -t ./package
