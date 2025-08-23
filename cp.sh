cd /data/server/source/wallet-server
git pull
mvn clean install
rm -rf /data/server/wallet-server.jar
mv /data/server/wallet-server/ruoyi-admin/target/ruoyi-admin.jar /data/server/wallet-server.jar
