FROM ubuntu:bionic

# Leitura de cartão
RUN apt -y update &&\
    apt install -y  pcscd \
    pcsc-tools \
    libpcsclite-dev \
    openjdk-8-jdk


ADD javacard /opt/javacard

ENV JC_HOME /opt/javacard/java_card_kit-2_2_2


CMD service pcscd start && bash