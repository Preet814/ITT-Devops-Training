import requests
import argparse
import json
import csv

URL = "https://random-data-api.com/api/v2/users"


def fetch_data_from_api():
    try:
        response = requests.get(URL)
        response.raise_for_status()  # Raises HTTP Error if status code is not 200
        return response.json()
    except (
        requests.exceptions.RequestException
    ) as e:  # Catch any kind of error that occur whlie making a request
        print(f"Error fetching data: {e}")
        return None


def save_data_as_json(file_path, data):
    with open(file_path, "w") as json_file:
        json.dump(data, json_file, indent=4)  # push the data to json file in format


def save_data_as_csv(file_path, data):
    with open(file_path, "w") as csv_file:
        writer = csv.DictWriter(
            csv_file, fieldnames=data.keys()
        )  # DictWriter used to write dictionaries (like JSON objects) to CSV files.
        writer.writeheader()  # Write first rows as keys
        writer.writerow(data)  # Write row of actual data


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--filePath",
        required=True,
        help="Add file path for storing data. File type must be either csv or json",
    )
    args = parser.parse_args()

    file_path = args.filePath
    data = fetch_data_from_api()

    if data is None:
        return

    if file_path.endswith(".json"):
        save_data_as_json(file_path, data)
    elif file_path.endswith(".csv"):
        save_data_as_csv(file_path, data)
    else:
        raise ValueError("File type is not supported (use .json or .csv)")


if __name__ == "__main__":
    main()
