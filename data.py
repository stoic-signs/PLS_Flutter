import pymongo as pm
from pymongo import MongoClient
import json

client = MongoClient(
    "mongodb+srv://vdBA11bTINyreU03:vdBA11bTINyreU03@cluster0.jx2oq.mongodb.net/myFirstDatabase?retryWrites=true&w=majority")
db = client.pls_bot
docs = db.question
with open("questions.json") as f:
    questions = json.loads(f.read())
questions
for scene, qs in questions.items():
    for q in qs:
        doc = {}
        doc['scenario'] = scene
        doc['qid'] = q['id']
        doc['question'] = q['question']
        doc['options'] = q['options']
        docs.insert_one(doc)
