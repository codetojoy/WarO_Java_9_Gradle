FROM ubuntu:14.04

# JDK 

RUN /bin/bash -c "mkdir -p /var/my_jdk"

COPY ./resources/jdk-9+181_linux-x64_bin.tar.gz /var/my_jdk

RUN /bin/bash -c 'cd /var/my_jdk    ; \
gunzip jdk-9+*_linux-x64_bin.tar.gz ; \
tar xf jdk-9+*_linux-x64_bin.tar    ; \
rm jdk-9+*.tar '

ENV JAVA_HOME /var/my_jdk/jdk-9
ENV PATH "${PATH}:${JAVA_HOME}/bin"

# Gradle

RUN /bin/bash -c "mkdir -p /var/my_gradle"

COPY ./resources/gradle-4.1-bin.zip /var/my_gradle

RUN /bin/bash -c 'cd /var/my_gradle ; \
jar xf gradle*.zip ; \
rm gradle*.zip '

ENV GRADLE_HOME /var/my_gradle/gradle-4.1
ENV PATH "${PATH}:${GRADLE_HOME}/bin"

RUN /bin/bash -c 'chmod 777 $GRADLE_HOME/bin/gradle'

