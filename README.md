
## Using rasa

Install rasa_nlu:
- cd rasa_nlu
- pip install -r requirements.txt
- pip install -e .
- cd hoaxlybot/rasa
- pip install rasa_nlu[spacy]
- python -m spacy download en_core_web_md
- python -m spacy link en_core_web_md en

Training server:
$ python -m rasa_nlu.train --config config.yml --data hoaxly-rasa-en.json --path projects

Starting server:
$ python -m rasa_nlu.server --path projects

Test:
$ curl -X POST localhost:5000/parse -d '{"q":"I am looking for Mexican food"}' | python -m json.tool

# Todos
- Add German configuration and training file.