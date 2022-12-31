echo "Please,Enter DB folder name "
read name
function checkName {
if [[ !($name =~ ^[A-Za-z]*$) ]];then
echo "invaild name"
return
else
for i in *
do
if [[ $i != $name ]]; then
 mkdir $name
 break
else
echo "It's already Exit"
break
fi
done
fi
}

function Drop {
echo "what is the DB you want to remove "
read name
rr=0
for i in *
do
if [[ $i = $name ]]; then
 rm -r $name
echo "Done removing"
let rr=$rr+2
break
fi
done
if [[ $rr<1 ]];then
echo "invalid"
fi
}
checkName 

while true
do
select choice in Create list Drop connect
do
case $choice in
Create)
echo "what is the DB name"
read name
checkName
break;;
list)
 cd $name
echo "this the list of ${name} DB "
ls -F | grep /
break;;
Drop)
Drop
break;;
connect)
 cd $name
source ~/Desktop/r.sh
break;;
esac
done
done
