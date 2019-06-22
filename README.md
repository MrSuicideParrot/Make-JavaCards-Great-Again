# Make JavaCards Great Again

[![](https://images.microbadger.com/badges/version/cirne/javacard-great-again.svg)](https://microbadger.com/images/cirne/javacard-great-again "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/cirne/javacard-great-again.svg)](https://microbadger.com/images/cirne/javacard-great-again "Get your own image badge on microbadger.com")

A docker environment to develop and install applets to a JavaCard.

## Obtaing this Docker image
### Pulling from the Docker Hub
```bash
$ docker pull cirne/javacard-great-again
```

### Building the Docker image locally
```bash
$ docker build . -t javacard-great-again
```
## Quick Start
```
$ docker run -ti --rm  --device /dev/bus/usb javacard-great-again
```

## What is installed?
This docker have instaled and configured the Java Card Development Kit 2.2.2, the pcsc lite to be able to comunicate directly with a smart card, the openjdk version 8, apache ant and the OpenSC.
### List of software:

* Java Card Development Kit 2.2.2
* Openjdk version 8
* Apache ant
* Apache maven
* Pcsc lite
* GlobalPlatformPro
* OpenSC
* Jcardsim

## Custom commands

* **gp**: Load and manage applets on compatible JavaCards from command line or from your Java project. More info on the [project page](https://github.com/martinpaljak/GlobalPlatformPro).

* **jcardc**: A script with javac configured with a javacard environment.

* **converter**: Aplication wich converts the *.class* files to applet *.cap* file. Syntax:
    ```
    converter  -applet  AID package_name.class_name package_name package_aid  major_version.minor_version
    ```
    The *package_name* is the name of the java packge and the *class_name* is the class  that defines the install method for the applet.

### Notes
All content from Java Card Development Kit 2.2.2  is &copy;&reg;&trade; by Oracle. We are distributing this SDK using this terms, [javacard/distributionREADME_JCDK2.2.2.txt](https://github.com/MrSuicideParrot/Make-JavaCards-Great-Again/blob/master/javacard/distributionREADME_JCDK2.2.2.txt).
