
mkdir -p /var/my_jdk
cd /var/my_jdk

# cp /data/resources/jdk-9+179_linux-x64_bin.tar.gz .
# gunzip jdk-9+179_linux-x64_bin.tar.gz
# tar xf jdk-9+179_linux-x64_bin.tar

export JAVA_HOME=/var/my_jdk/jdk-9
export PATH=$JAVA_HOME/bin:$PATH

mkdir -p /var/my_gradle
cd /var/my_gradle
cp /data/resources/gradle*.zip .
jar xf gradle*.zip 
chmod -R 777 * 

echo "Ready."
