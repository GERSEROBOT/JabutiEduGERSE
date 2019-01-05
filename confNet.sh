#! /bin/bash
D_NET="/etc/network/interfaces"
D_CONF="./confi"

echo "Editando arquivo $D_NET"
echo "com:"

cat $D_CONF/lo
sudo cat $D_CONF/lo >> $D_NET
sleep 1

cat $D_CONF/eth0
sudo cat $D_CONF/eth0 >> $D_NET
sleep 1

cat $D_CONF/wlan0
sudo cat $D_CONF/wlan0 >> $D_NET
sleep 1

echo "#####################################################################"
echo "#####################################################################"
echo "#####################################################################"
echo "arquivo $D_NET configuarado"
echo "cat $D_NET"
cat $D_NET
sleep 3
