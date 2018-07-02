This repo provides a configured instance for running rasa NLU including a trained project for the hoaxlybots.

## Installing rasa

Please see https://nlu.rasa.com/installation.html 
You can skip this if you use rasa with our docker image.


We currently use spaCy + sklearn as backend.

## Using our rasa docker image

We provide custom docker images you can use. Currently you need have to access to registry.acolono.net, 
but we will document an alternativ approach soon.

$docker login registry.acolono.net:444
$docker pull registry.acolono.net:444/hoaxly/hoaxly-rasa-nlu-container:develop
$docker run -p 5000:5000 registry.acolono.net:444/hoaxly/hoaxly-rasa-nlu-container:develop

Now you can login and test if everything is working:
$docker run -it --entrypoint=bash -p 5000:5000 registry.acolono.net:444/hoaxly/hoaxly-rasa-nlu-container:latest
$curl -X POST localhost:5000/parse -d '{"q":"Please check url www.url.com/article"}'

## Training the rasa server without docker

$ python -m rasa_nlu.train --config config.yml --data hoaxly-rasa-en.json --path projects

Starting server:
$ python -m rasa_nlu.server --path projects

Test:
$ curl -X POST localhost:5000/parse -d '{"q":"Please check url www.url.com/article"}' | python -m json.tool


## Training the rasa server with our docker image

$docker run -v $(pwd)/projects:/app/projects 
 -v $(pwd)/config.yml:/app/config.yml 
 -v $(pwd)/data:/app/data  -p 5000:5000 
 registry.acolono.net:444/hoaxly/hoaxly-rasa-nlu-container:develop 
 run python -m rasa_nlu.train  -c /app/config.yml  -d data/hoaxly-rasa-en.json  
 --project hoaxly  --path projects

# License

See inlcuded license file.

# Todos
- More trainings.
- Add German configuration and training file.
