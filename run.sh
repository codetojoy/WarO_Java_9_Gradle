
JARS=$PWD/org.peidevs.waro.main/staging/lib
MLIB=$PWD/org.peidevs.waro.main/staging/lib

CLASSPATH=$JARS/commons-logging-1.2.jar
CLASSPATH=$CLASSPATH:$JARS/spring-aop-4.1.5.RELEASE.jar
CLASSPATH=$CLASSPATH:$JARS/spring-expression-4.1.5.RELEASE.jar

# run

java \
--class-path $CLASSPATH \
--module-path $MLIB \
--add-modules org.peidevs.waro.main \
--add-opens java.base/java.lang=spring.core \
org.peidevs.waro.Main


