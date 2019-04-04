# First example of Docker with Python Flask app

1. Build image `docker build --tag=friendlyhello .`

1. Check for images `docker image ls`

1. Run image ``docker run -p 4000:80 friendlyhello``

    Note: the `-p` maps the host's port 4000 to the container port 80.

1. From host computer, via a browser window access Flask App on address `localhost:4000`

1. Hit `CTRL+C` to quit in the terminal.

Alternatively:

1. Run image in detached mode: ``docker run -d -p 4000:80 friendlyhello``

1. List containers that are running `docker ps`. Look for the `CONTAINER_ID` that is running.

1. Stop container `docker container stop <CONTAINER_ID>`
