# Make JavaCards Great Again

A docker environment to develop and install applets to a JavaCard.

To compile:
```bash
$ docker build . -t javacard-great-again
```

To run:
```
docker run -ti  --device /dev/bus/usb javacard-great-again
```