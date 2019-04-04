# Light JupyterLab with Python3 example

1. Build image ``docker build --tag=jupyter_light_workshop .``

1. Run image ``docker run -ti -p 8888:8888 -v "`pwd`":/data jupyter_light_workshop``.

    Note: you need to run the image in the directory you want JupyterLab to access.

    Running the image will open a terminal window in the container, where you will be acting as root.

1. Access `/data` directory `cd data`. This directory has mounted the wanted directory from the host.

1. Run JupyterLab within the container ``/usr/local/bin/jupyter lab --port=8888 --ip=0.0.0.0 --no-browser --allow-root --LabApp.token=''``

1. From host computer, via a browser window access JupyterLab on address `localhost:8888`. There you can test the kernel, for example, by running `test.ipynb`

1. You can also access the container on a different terminal with ``docker exec -it <CONTAINER_ID> bash`` and see processes running `docker ps -A` to identify the different processes.
