#! /bin/bash
D_BLE="/etc/systemd/system/"
D_CONF="./confi"
D_PROG="./prog"


echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "update e upgrade"
sudo apt update
sudo apt upgrade -y

echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "istalando componentes do bluetooth"
sudo apt install bluetooth bluez bluez-tools blueman -y

echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "sitalando outras dependencias"
sudo apt install python-serial -y
sudo apt-get install expect -y

echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "configurnado $D_BLE"
sudo cp $D_CONF/dbus-org.bluez.service $D_BLE
cat /etc/systemd/system/dbus-org.bluez.service
sleep(1)

echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "instalando controle do jabuti"
sleep 1

echo "criando diretorio /opt/jabutEdu/ ...."
sudo mkdir -p /opt/jabutEdu/
sleep 1


echo "criando arquivos ...."
sudo cp $D_PROG/* /opt/jabutEdu/
sleep 1


echo "criando links sinbolicos em /usr/local/bin/ ...."
sudo ln /opt/jabutEdu/mainJabutiEdu.sh /usr/local/bin/jabutiEduRun
sudo ln /opt/jabutEdu/jabutiEduCTL.py /usr/local/bin/jabutiEduCTL
sudo ln /opt/jabutEdu/setBle.exp /usr/local/bin/setBle
sleep 1

echo "istalação concluida"
