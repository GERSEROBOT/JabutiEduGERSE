# !/bin/bash +x

echo "--------------------------------------------------------"
echo "--------------------------------------------------------"
echo "--------------------------------------------------------"
echo "configurando contorle bluetooth"
sudo setBle
sleep 1
clear

sudo rfkill unblock all
sudo systemctl restart bluetooth
sleep 1

echo "--------------------------------------------------------"
echo "--------------------------------------------------------"
echo "--------------------------------------------------------"
echo "iniciando janela de conexão"
sudo rfcomm watch hci0 & PDI=$!
echo "porcesso rfcomm PDI: $PDI"
echo
echo

while :; do
	echo "--------------------------------------------------------"
	echo "--------------------------------------------------------"
	echo "--------------------------------------------------------"
	echo "procurando por porta /dev/rfcomm0"
	echo "porcesso rfcomm PDI: $PDI"
	sudo jabutiEduCTL
	clear
done
