#!/bin/bash
file=interfaces
file_2=interfaces_no_reboot.sh

ip=93.171.177.
min=1
max=62
n=31

echo "#!/bin/bash" >$file_2
chmod +x $file_2

for ((i=$min; i<=$max; i++))
do
echo >>$file

echo "auto lo:$n">>$file
echo "   iface lo:$n inet static">>$file
echo "   address $ip$i">>$file
echo "   netmask 255.255.255.255">>$file

echo "ifconfig lo:$n $ip$i netmask 255.255.255.255 up" >>$file_2

let "n=n+1"
done
