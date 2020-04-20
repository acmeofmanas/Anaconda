file="$(mktemp /tmp/python-install.XXXXXX)"
echo logfile name: $file
echo " Please provide package name and PRESS RETURN"
echo "Package name could be like \"pandasql\" or \"-c anaconda pandasql\""
read -p "provide packages name: " input1 input2 input3

if [ -z "$input1" ];
then
    echo " Please provide package name"
exit 1
else
printf "Wait Installing your  package "
#printf "Wait Installing your  package %s " "$input1"
fi

#printf "\n $input1"
ack="-y"
if conda install $input1 $input2 $input3 $ack  > $file  2>&1;
then
  printf "\n everything fine let's move to cluster deployment \n"
else
  printf "\n please double check your package or connection. For more details checkout $log_file \n"
exit 1
fi

for i in cdhdn{01..25};do echo $i;ssh $i "if conda install $input1 $input2 $input3 $ack; then printf "\n next node\n"; else printf "\n failed.pls debug\n" ;fi" >> $file  2>&1 ;done
