import ollama
import numpy as np
import json
from sklearn.metrics.pairwise import cosine_similarity

data = {
    "report_1": {
        "columns": ["name", "vorname", "alter"],
        "path": "path/to/report1",
    },
    "report_2": {
        "columns": ["name", "ort", "land"],
        "path": "path/to/report2",
    },
    "report_3": {
        "columns": ["vorname", "geschlecht", "groesse"],
        "path": "path/to/report3",
    },
}

for report_name, report_data in data.items():
    PROMPT = ", ".join(report_data["columns"])
    embedded_data = ollama.embeddings(model="nomic-embed-text", prompt=PROMPT)
    report_data["embedding"] = embedded_data["embedding"]

USER_INPUT = "vater, alter, kind"
user_input_embedded = ollama.embeddings(model="nomic-embed-text", prompt=USER_INPUT)


for report_name, report_data in data.items():
    vec1 = np.array(report_data["embedding"]).reshape(1, -1)
    vec2 = np.array(user_input_embedded["embedding"]).reshape(1, -1)
    similarity = cosine_similarity(vec1, vec2)
    report_data["similarity"] = round(similarity.flatten()[0], 2)
    report_data["matching_columns"] = np.intersect1d(
        report_data["columns"], USER_INPUT.split(", ")
    )


most_similar_report = max(data, key=lambda x: data[x]["similarity"])
if data[most_similar_report]["similarity"] <= 0.6:
    print("No similar Report found --> Create New Report")
else:
    print("--------------------------------------------")
    print(f"Most similar Report: {most_similar_report}")
    print(f"Matching columns:    {data[most_similar_report]['matching_columns']}")
    print(f"Path:                {data[most_similar_report]['path']}")
    print("--------------------------------------------")
