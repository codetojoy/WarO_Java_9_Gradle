### WarO_Java_9

* This is an example **experimenting** with JDK 9 modules with Gradle.
* **NOTE**: From a comment in [this thread](https://github.com/gradle/gradle/issues/2334), the goal for Gradle 4.1 is _to build a project with JDK 9_, **not** to support Jigsaw. So this is simply an illustration of using Gradle within those constraints.
* see "Notes" below regarding issues (e.g. unit-tests simply use the classpath)

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
* JDK 9 b170+ from [here](http://jdk.java.net/9/)
* Gradle 4.1 M1 from [here](https://github.com/gradle/gradle/releases/tag/v4.1.0-milestone-1)

### Set Up Instructions (if using Docker) 

* if using Docker, place JDK 9 and Gradle 4.1M1 gz/zip files in `~/resources` 

#### setup container

* run: `docker build -t="jdk9/b175" .` 
* run: `docker run -i -t -v $(pwd):/data jdk9/b175`
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
    * to prepare jars, automatic modules: `gradle prepare`
    * to build: `./build.sh`
    * to run app: `./run_waro_main.sh`
    * to test: `./test.sh`

### Runtime Layout

* `jars` contain 3rd-party jars on the classpath
* `mjars` contains 3rd-party jars used as automatic modules
    * Note: `jars`,`mjars` populated by `~/build.gradle` 
* `mlib` contains modular jars built by Gradle (i.e. code in this repository)
    
### Notes

* In my experience with Gradle 4.1M1, the `jar` task puts the module name in the package of files:
    * `org.peidevs.waro.base/org/peidevs/waro/base/.../Player.class`
    * As a kludge, I have custom code that strips the top level module name.
* Running unit tests is a challenge, so there are seperate `test.build.gradle` files that uses all jars on the classpath.
* This might be my mistake, or possibly just early issues. I'll update this repo as things get sorted out.

