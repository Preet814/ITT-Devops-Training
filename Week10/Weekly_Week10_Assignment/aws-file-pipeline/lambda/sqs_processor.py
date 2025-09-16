import json
import boto3
import zipfile
import os
import csv
import logging
from utils.s3_helper import download_file_from_s3, upload_file_to_s3

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)


def txt_to_csv(txt_path, csv_path):
    """
    Converts a .txt file to .csv assuming line-separated whitespace values.
    """
    try:
        with open(txt_path, "r") as txt_file, open(
            csv_path, "w", newline=""
        ) as csv_file:
            writer = csv.writer(csv_file)
            for line in txt_file:
                row = line.strip().split()
                writer.writerow(row)
        logger.info("Converted TXT to CSV: %s", csv_path)
    except Exception as e:
        logger.error("Error converting TXT to CSV: %s", e)
        raise


def json_to_csv(json_path, csv_path):
    """
    Converts a .json file to .csv based on expected structure.
    """
    try:
        with open(json_path, "r") as json_file, open(
            csv_path, "w", newline=""
        ) as csv_file:
            data = json.load(json_file)
            writer = csv.writer(csv_file)

            if isinstance(data, list):
                headers = data[0].keys()
                writer.writerow(headers)
                for entry in data:
                    writer.writerow(entry.values())
            elif isinstance(data, dict):
                writer.writerow(data.keys())
                writer.writerow(data.values())
            else:
                raise ValueError("Unsupported JSON structure for conversion")
        logger.info("Converted JSON to CSV: %s", csv_path)
    except Exception as e:
        logger.error("Error converting JSON to CSV: %s", e)
        raise


def lambda_handler(event, context):
    try:
        logger.info("Event received: %s", json.dumps(event))

        # Extract bucket and key from SQS message
        records = event["Records"]
        message = json.loads(records[0]["body"])
        bucket_name = message["bucket"]
        object_key = message["key"]

        logger.info("Downloading file %s from bucket %s", object_key, bucket_name)

        # Download zip file from S3
        download_path = f"/tmp/{os.path.basename(object_key)}"
        download_file_from_s3(bucket_name, object_key, download_path)
        logger.info("File downloaded to: %s", download_path)

        # Extract zip contents
        extract_dir = "/tmp/unzipped"
        os.makedirs(extract_dir, exist_ok=True)

        with zipfile.ZipFile(download_path, "r") as zip_ref:
            zip_ref.extractall(extract_dir)
            logger.info("Extracted files: %s", zip_ref.namelist())

        uploaded_files = []

        # Walk through extracted files and convert to CSV if necessary
        for root, dirs, files in os.walk(extract_dir):
            for file in files:
                file_path = os.path.join(root, file)

                if file.endswith(".txt") or file.endswith(".json"):
                    csv_path = file_path.rsplit(".", 1)[0] + ".csv"

                    try:
                        if file.endswith(".txt"):
                            txt_to_csv(file_path, csv_path)
                        elif file.endswith(".json"):
                            json_to_csv(file_path, csv_path)

                        # Determine relative path for S3 output key
                        relative_path = os.path.relpath(csv_path, extract_dir)
                        output_key = f"output/{relative_path}"

                        # Upload CSV to S3
                        upload_file_to_s3(csv_path, bucket_name, output_key)
                        logger.info(
                            "Uploaded CSV to s3://%s/%s", bucket_name, output_key
                        )

                        uploaded_files.append(output_key)

                    except Exception as convert_err:
                        logger.error(
                            "Error converting/uploading file %s: %s", file, convert_err
                        )

        return {
            "statusCode": 200,
            "body": json.dumps(
                {
                    "message": "Zip file processed and converted files uploaded as CSV.",
                    "converted_files": uploaded_files,
                }
            ),
        }

    except Exception as e:
        logger.exception("Error processing zip file: %s", str(e))
        return {
            "statusCode": 500,
            "body": json.dumps(
                {
                    "message": "Internal server error while processing the zip file.",
                    "error": str(e),
                }
            ),
        }
