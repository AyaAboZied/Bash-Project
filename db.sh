
echo "Please,Enter DB folder name "
read name
function checkName {
for i in *
do
if [ $i != $name ]; then
 mkdir $name
 cd ./$name
 break
<<c
elif [ -d "$i" ]&&[  $i = $name ];then
   echo "already exist as Directory"
   cd ./$name
else
echo "already exist as file ,enter name again" 
 break
c
else
 cd ./$name
echo "It's already Exit"
break
fi
done
}

function Drop {
echo "what is the DB you want to remove "
read name
for i in *
do
if [ $i = $name ]; then
 rm -r $name
echo "Done removing"
else
 echo "Enter correct name"
break
fi
done
}
checkName 


select choice in Create list Drop connect
do
case $choice in
Create)
echo "what is the DB name"
read name
checkName
break;;
list)
echo "this the list of DB"
ls -F | grep /
break;;
Drop)
Drop
break;;
connect)
cd ..
sh ./r.sh
break;;
esac
done


