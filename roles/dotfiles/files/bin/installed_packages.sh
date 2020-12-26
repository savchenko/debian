location=${1%}
location_temp="$location.bak"

#deleteUninstalled="false"
sort="true"

touch $location
echo "" > $location
touch $location_temp
echo "" > $location_temp

cat /var/log/apt/history.log | grep 'apt-get install' >> $location
cat /var/log/apt/history.log | grep 'apt install' >> $location
zcat /var/log/apt/history.log.*.gz | grep 'apt-get install' >> $location
zcat /var/log/apt/history.log.*.gz | grep 'apt install' >> $location

sed -i -e 's/Commandline: apt-get install //g' $location
sed -i -e 's/Commandline: apt install //g' $location
sed -i -e 's/ /\n/g' $location

#delete options of apt like -y -t etc.
sed -i -e '/^#/ d' $location
sed -i -e '/^-/ d' $location

#delete non-package entries
sed -i -e 's/\/testing//g' $location
sed -i -e 's/\/stable//g' $location
sed -i -e 's/\/experimental//g' $location
sed -i -e 's/\/unstable//g' $location

sed -i -e 's/^testing//g' $location
sed -i -e 's/^stable//g' $location
sed -i -e 's/^experimental//g' $location
sed -i -e 's/^unstable//g' $location

#delete blank entries
sed -i -e '/^[[:space:]]*$/d' $location

#delete duplicates
awk '!seen[$0]++' $location > $location_temp
cp $location_temp $location
echo "" > $location_temp

#delete uninstalled packages
#not working yet
#if [[ $deleteUninstalled == "true" ]]
#then
#       i=1
#       cat $location | while read line
#       do
#               if [ $(dpkg-query -W -f='${Status}' $line 2>/dev/null | #grep -c "ok installed") -eq 0 ];
#               then
#                       echo $line installed - keeping
#               else
#                       echo $line not installed - deleting
#                       sed -i -e "s/^$line$//g" $location
#                       let i++
#               fi
#       done
#fi

#delete blank entries again
sed -i -e '/^[[:space:]]*$/d' $location

#sort
if [[ $sort == "true" ]]
then
        sort $location > $location_temp
        mv $location_temp $location
fi
