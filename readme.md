# Light JupyterLab with Python3 example

1. Build image `docker build --tag=jupyter_light . `

1. Run image ``docker run -ti -p 8888:8888 -v "`pwd`":/project jupyter_light``

    Note: you need to run the image in the directory you want JupyterLab to access.

    Alternatively you can pull the image:

    ``docker run -ti -p 8888:8888 -v "`pwd`":/project gpadres/jupyter_light``

    Running the image will start JupyterLab in the container.

1. From host computer, via a browser window access JupyterLab on address `localhost:8888`
