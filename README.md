
### Current Status

* MAR 2021
* this project is messed up, when trying to remove `jcenter`

### WarO_Java_9

* This is an example illustrating JDK 9 modules with Gradle.
* There are also versions for using [command-line tools](https://github.com/codetojoy/WarO_Java_9) and [Maven](https://github.com/codetojoy/WarO_Java_9_Maven) (a work in progress).
* Tested with JDK 9 b181 and Gradle 4.1 (as of 09-AUG-2017).
* [This Gradle guide](https://guides.gradle.org/building-java-9-modules/) was highly useful as a reference.
* Note: I deviated from the guide when configuring the Gradle application to run the app. See [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.main/build.gradle). Steps:
    * `import java.util.regex.Matcher`  
    * use `'--add-modules', moduleName` instead of  `'--module', mainClassName`
    * add `'--add-opens', 'java.base/java.lang=spring.core'` due to the nature of this app 

WarO is a code exercise based on a simple card game. Rules are documented [here](https://github.com/peidevs/WarO_Java/blob/master/Rules.md).

### Java 9 Features 

* This example contains 3 modules. They are somewhat arbitrary, as this project was
written without modules in mind.
* See diagram below
* `org.peidevs.waro.base`
    * requires Spring "automatic modules"
    * exports several utility packages
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.base/src/main/java/org.peidevs.waro.base/module-info.java)
* `org.peidevs.waro.function`
    * requires `waro.base` and Guava automatic module
    * exports functional packages 
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.function/src/main/java/org.peidevs.waro.function/module-info.java)
* `org.peidevs.waro.main`
    * requires `org.peidevs.waro.base` and `org.peidevs.waro.function`
    * see module-info.java [here](https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/org.peidevs.waro.main/src/main/java/org.peidevs.waro.main/module-info.java)

* Overview:

<img style="float: center;" src="https://github.com/codetojoy/WarO_Java_9_Gradle/blob/master/images/module_diagram_WarO.png"></img>

### Prerequisites

* Docker (optional)
* JDK 9 b179+ from [here](http://jdk.java.net/9/)
* Gradle 4.1 from [here](https://gradle.org/releases/)

### Set Up Instructions (if using Docker) 

* if using Docker, place JDK 9 and Gradle 4.1 gz/zip files in `~/resources` 
* `Dockerfile` currently assumes JDK 9 b181 and Gradle 4.1
    * if using different versions, edit `Dockerfile` appropriately

#### setup container

* run: `docker build -t="jdk9/waro" .` 
* run: `docker run -i -t -v $(pwd):/data jdk9/waro`
* confirm: `java --version` and `gradle -version`

#### using container

* `docker start [container name]`
* `docker attach [container name]`
* confirm: `java --version` and `gradle -version`

### Build Instructions 

* outside of container:
    * configure game by editing `org/peidevs/waro/config/impl/Config.java` in `org.peidevs.waro.base/src/main/java/org.peidevs.waro.base` (Yes, this is painful, but OK for an illustration.)
* inside Docker container:
    * first: `cd /data`
    * to build: `gradle jar`
    * to test: `gradle test`
    * to run app (from Gradle):
        * `gradle :org.peidevs.waro.main:run`
    * to run app (as script):
        * `gradle :org.peidevs.waro.main:installDist`
        * then `./org.peidevs.waro.main/staging/bin/org.peidevs.waro.main`
        * or a home-grown version for trouble-shooting: `./run.sh`

### Automatic Modules

* Compare the `build.gradle` files with the `module-info.java` files.
* Automatic modules are specified in `dependencies` as usual. Gradle is clearly adding value by translating between the two: 

| Module  | in module-info.java | in Gradle |
| ------------- | ------------- | ------------- |
| org.peidevs.waro.base  | spring.beans  | org.springframework:spring-beans:4.1.5.RELEASE |
| org.peidevs.waro.base  | spring.context  | org.springframework:spring-context:4.1.5.RELEASE |
| org.peidevs.waro.base  | spring.core  | org.springframework:spring-core:4.1.5.RELEASE |
| org.peidevs.waro.function  | guava  | com.google.guava:guava:18.0 |

