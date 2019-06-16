# Make JavaCards Great Again

A docker environment to develop and install applets to a JavaCard.

To compile:
```bash
$ docker build . -t javacard-great-again
```

To run:
```
$ docker run -ti --rm  --device /dev/bus/usb javacard-great-again
```

## What is installed?
This docker have instaled and configured the Java Card Development Kit 2.2.2, the pcsc lite to be able to comunicate directly with a smart card, the openjdk version 8, apache ant and the OpenSC.
### List of software:

* Java Card Development Kit 2.2.2
* Openjdk version 8
* Apache ant
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
