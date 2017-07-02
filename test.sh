
./clean.sh

./build.sh

echo "running tests for base"
cd org.peidevs.waro.base
gradle -b test.build.gradle clean test

cd ..

echo "running tests for function"
cd org.peidevs.waro.function
gradle -b test.build.gradle clean test

echo "Ready."
