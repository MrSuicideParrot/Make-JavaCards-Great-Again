FROM openjdk:7u221-jdk-slim-jessie

# Leitura de cartão
RUN apt-get -y update &&\
    apt-get install -y  pcscd \
    pcsc-tools \
    libpcsclite-dev


ADD javacard /opt/javacard

ENV JC_HOME /opt/javacard

ENV JC_PATH $JC_HOME/lib/

RUN echo '#!/bin/sh\n\
    JC_HOME=~/.javacard/\n\
    JC_PATH=$JC_HOME/lib/apdutool.jar:$JC_HOME/lib/apduio.jar:$JC_HOME/lib/converter.jar:$JC_HOME/lib/jcwde.jar:$JC_HOME/lib/scriptgen.jar:$JC_HOME/lib/offcardverifier.jar:$JC_HOME/lib/api.jar:$JC_HOME/lib/installer.jar:$JC_HOME/lib/capdump.jar:$JC_HOME/samples/classes:$CLASSPATH\n\
    JFLAGS="-classpath $JC_PATH"\n\
    $JAVA_HOME/bin/java $JFLAGS com.sun.javacard.converter.Converter -exportpath $JC_HOME/api_export_files "$@"' > converter && chmod +x converter

RUN echo '#!/bin/sh\njavac -g -cp $JC_HOME/lib/api.jar -source 1.5 -target 1.5 "$@"' > jcardc && \
    chmod +x jcardc && mv jcardc /usr/bin

RUN echo '#!/bin/bash\nJSIMCLASSPATH=$JC_HOME/jcardsim-2.2.2-all.jar:.\n $JAVA_HOME/bin/java -classpath $JSIMCLASSPATH com.licel.jcardsim.utils.APDUScriptTool "$@"' > jcardsim-run &&\
    chmod +x jcardsim-run && mv jcardsim-run /usr/bin

RUN echo '#!/bin/sh\njava -jar $JC_HOME/gp.jar "$@"'> gp && chmod +x gp && mv gp /usr/bin


CMD service pcscd start && bash
