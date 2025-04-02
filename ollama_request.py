import ollama

model = "gemma2:2b"
prompt = """Hier die Query:
SELECT count(DISTINCT "L62T14"."SHORTL62") AS "C0"
FROM "L54T1" "L54T1",
     "L62T14",
     "O08T15",
     "O42T2" "O42T2"
WHERE "L54T1"."ADMUNIT" IN ('14P1', '14P2')
  AND "L54T1"."L54STATE" IN (1, 2)
  AND trim(BOTH FROM to_char("O42T2"."OCARRNO")) = trim(BOTH FROM "L54T1"."L54GR2")
  AND "O08T15"."SHORTO08" = "O42T2"."SHORTO08"
  AND "O08T15"."SHORTL62" = "L62T14"."SHORTL62"
"""

response = ollama.generate(model=model, prompt=prompt)

print("Response from Ollama:")
print(response["response"])  # Falls die Antwort als Dictionary zurückkommt
