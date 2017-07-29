[![Build Status](https://travis-ci.org/codetojoy/WarO_Java_9_Gradle.svg?branch=master)](https://travis-ci.org/codetojoy/WarO_Java_9_Gradle)

### WarO_Java_9

* This is an example illustrating JDK 9 modules with Gradle.
* Currently uses JDK9 b179 and Gradle 4.1 RC1 (as of 27-JUL-2017).
* [This Gradle guide](https://guides.gradle.org/building-java-9-modules/) was highly useful as a reference.
* Note: there is currently [an issue](https://github.com/codetojoy/WarO_Java_9_Gradle/issues/1) with configuring the Gradle application to run the app.

WarO is a code exercise based on a simple card game. Rules are documented [here](https://github.com/peidevs/WarO_Java/blob/master/Rules.md).

### Java 9 Features 

* This example contains 3 modules. They are somewhat arbitrary, as this project was
written without modules in mind.
* `org.peidevs.waro.base`
    * requires Spring "automatic modules"
    * exports several utility packages
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.base/src/main/java/org.peidevs.waro.base/module-info.java)
* `org.peidevs.waro.function`
    * requires `waro.base` and Guava automatic module
    * exports functional packages 
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.function/src/main/java/org.peidevs.waro.function/module-info.java)
* `org.peidevs.waro.main`
    * requires `org.peidevs.waro.base` and `org.peidevs.waro.function`base
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.main/src/main/java/org.peidevs.waro.main/module-info.java)

### Prerequisites

* Docker (optional)
* JDK 9 b179+ from [here](http://jdk.java.net/9/)
* Gradle 4.1 RC1 from [here](https://github.com/gradle/gradle/releases/tag/v4.1.0-RC1)

### Set Up Instructions (if using Docker) 

* if using Docker, place JDK 9 and Gradle 4.1 RC1 gz/zip files in `~/resources` 

#### setup container

* run: `docker build -t="jdk9/waro" .` 
* run: `docker run -i -t -v $(pwd):/data jdk9/waro`
* inside container, run: `/data/resources/install.sh`
* inside container, run: `. /data/resources/setvars.sh`
* confirm: `java --version` and `gradle -version`

#### using container

* `docker start [container name]`
* `docker attach [container name]`
* run: `. /data/resources/setvars.sh`
* confirm: `java --version` and `gradle -version`

### Build Instructions 

* outside of container:
    * configure game by editing `org/peidevs/waro/config/impl/Config.java` in `org.peidevs.waro.base/src/main/java/org.peidevs.waro.base` (Yes, this is painful, but OK for an illustration.)
* inside Docker container:
    * first: `cd /data`
    * to build: `gradle jar`
    * to test: `gradle test`
    * **NOTE**: For running the application, I've tried to follow the guide, but am encountering problems. Will update when I can.
    * to run app (for now):
        * `gradle :org.peidevs.waro.main:installDist`
        * `./run.sh`

### Automatic Modules

* Compare the `build.gradle` files with the `module-info.java` files.
* Automatic modules are specified in `dependencies` as usual. Gradle is clearly adding value by translating between the two. e.g. Resolving that `spring.beans` in `module-info.java` refers to `org.springframework:spring-beans:4.1.5.RELEASE` in `build.gradle`.

### TODO

* The `org.peidevs.waro.base` module exports internals to `org.peidevs.waro.function` for testing. This needs to be cleaned up.
