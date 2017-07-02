### WarO_Java_9

WarO is a code exercise based on a simple card game. Rules are documented [here](https://github.com/peidevs/WarO_Java/blob/master/README.md).

### Java 9 Features 

* This example contains 3 modules. They are somewhat arbitrary, as this project was
written without modules in mind.
* org.peidevs.waro.base
    * requires Spring "automatic modules"
    * exports several utility packages
* org.peidevs.waro.function
    * requires `waro.base` and Guava automatic module
    * exports functional packages 
* org.peidevs.waro.main
    * requires `org.peidevs.waro.base` and `org.peidevs.waro.function`

### Prerequisites

* Docker
* JDK 9 b170+ from [here](http://jdk.java.net/9/)
* Gradle 4.1 M1 from [here](https://github.com/gradle/gradle/releases/tag/v4.1.0-milestone-1)

### Set Up Instructions 

* place JDK 9 and Gradle 4.1M1 gz/zip files in `~/resources` 

#### initial setup

* run: `docker build -t="jdk9/b175" .` 
* run: `docker run -i -t -v $(pwd):/data jdk9/b175`
* inside container, run: `/data/resources/install.sh`
* inside container, run: `. /data/resources/setvars.sh`
* confirm: `java --version` and `gradle -version`

#### subsequent steps

* `docker start [container name]`
* `docker attach [container name]`
* run: `. /data/resources/setvars.sh`
* confirm: `java --version` and `gradle -version`

### Build Instructions 

* inside Docker container:
    * to prepare jars: `./prepare.sh`
    * configure game by editing `org/peidevs/waro/config/impl/Config.java` in `org.peidevs.waro.base/src/main/java/org.peidevs.waro.base` (yes indeed, this sucks)
    * to build: `./build.sh`
    * to run app: `./run_waro_main.sh`
