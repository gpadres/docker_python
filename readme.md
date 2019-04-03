# Super Light example with Python3.

1. Build image `docker build --tag=super_light_example .`

1. Run image ``docker run -v "`pwd`":/app super_light_example``

    Note: you need to run the image in the same directory where `data_in.csv` is located.
