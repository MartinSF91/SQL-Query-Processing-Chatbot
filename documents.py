import ollama
import chromadb
import json

# https://ollama.com/blog/embedding-models

# documents = [
#     "Tabelle 1: Name, Vorname, Alter",
#     "Tabelle 2: Stadt, Vorname, Geschlecht",
#     "Tabelle 3: Name, Geschlecht, Groesse",
# ]

document_summary = {
    "table_1": {"columns": ["name", "vorname", "alter"], "path": "path/to/table_1"},
    "table_2": {"columns": ["stadt", "plz", "land"], "path": "path/to/table_2"},
}


documents = json.dumps(document_summary)


model = "nomic-embed-text:latest"

client = chromadb.Client()
collection = client.create_collection(name="docs")

# store each document in a vector embedding database
for i, d in enumerate(documents):
    response = ollama.embed(model=model, input=d)
    embeddings = response["embeddings"]
    collection.add(ids=[str(i)], embeddings=embeddings, documents=[d])

print("Documents successfully added! Processing...")

print(embeddings[0])


# # an example input
# input = "table_1"

# # generate an embedding for the input and retrieve the most relevant doc
# response = ollama.embed(model=model, input=input)
# results = collection.query(query_embeddings=response["embeddings"], n_results=1)
# data = results["documents"][0][0]


# # generate a response combining the prompt and data we retrieved in step 2
# output = ollama.generate(
#     model="gemma2:2b",
#     prompt=f"Using this data: {data}. Respond to this prompt: {input}",
# )

# print(output["response"])
# print("Complete!")
