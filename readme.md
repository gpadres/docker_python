# Light JupyterLab with Python3 example

1. Build image `docker build --tag=jupyter_light_workshop . `

1. Run image `docker run -ti -p 8888:8888 -v "`pwd`":/data jupyter_light_workshop`.

  Note: you need to run the image in the directory you want JupyterLab to access.

  Running the image will open a terminal window in the container, where you will be acting as root.

1. Run JupyterLab within the container `/usr/local/bin/jupyter lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root --LabApp.token=''`

1. From host computer, via a browser window access JupyterLab on address `localhost:8888`
