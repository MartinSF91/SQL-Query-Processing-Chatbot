import requests
import json

# Set up the base URL for the local Ollama API
url = "http://localhost:11434/api/chat"

# Define the payload (your input prompt)

table1 = {
    "col_1": "name",
    "col_2": "vorname",
    "col_3": "alter",
}

table2 = {
    "col_1": "name",
    "col_2": "vorname",
    "col_3": "geschlecht",
}

payload = {
    "model": "gemma2:2b",  # Replace with the model name you're using
    "messages": [{"role": "user", "content": [table1, table2]}],
}

# Send the HTTP POST request with streaming enabled
response = requests.post(url, json=payload, stream=True)

# Check the response status
if response.status_code == 200:
    print("Streaming response from Ollama:")
    for line in response.iter_lines(decode_unicode=True):
        if line:  # Ignore empty lines
            try:
                # Parse each line as a JSON object
                json_data = json.loads(line)
                # Extract and print the assistant's message content
                if "message" in json_data and "content" in json_data["message"]:
                    print(json_data["message"]["content"], end="")
            except json.JSONDecodeError:
                print(f"\nFailed to parse line: {line}")
    print()  # Ensure the final output ends with a newline
else:
    print(f"Error: {response.status_code}")
    print(response.text)
