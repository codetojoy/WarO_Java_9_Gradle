
mkdir -p /var/my_jdk
cd /var/my_jdk

# cp /data/resources/jdk-9+175_linux-x64_bin.tar.gz .
# gunzip jdk-9+175_linux-x64_bin.tar.gz
# tar xf jdk-9+175_linux-x64_bin.tar

mkdir -p /var/my_gradle
cd /var/my_gradle
cp /data/resources/gradle*.zip .
jar xf gradle*.zip 
chmod -R 777 * 

echo "Ready."
