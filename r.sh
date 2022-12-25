<<o
n=cut -d: -f1  h | grep "^-\?[0-9]+$"
if [$n];then
echo "doneeeee"
else
echo $n
fi
o
echo "Enter table name"
read name
function checkName {
for i in *
do
if [ $i != $name ]; then
 touch $name
else
<<c
 if [ -d "$i" ]
 echo "already exist as Directory"
 else
 echo "already exist as file"
 fi
c
 echo "already exist"
fi
done
}

checkName


function insert {
echo "Enter number of field"
read x
i=0
echo "Enter your column name,type *please seperate with : *"
while [ $i -lt $x ]
do
read col
echo $col  >> $name
let i=$i+1
if [$i >= 1];then
cut -d: -f1  $name | grep "^-\?[0-9]+$"

done
}


function Drop {
echo "please enter the name of table you want to remove"
read name
for i in *
do
if [ $i = $name ]; then
 rm -i $name
else
 echo "Enter correct name"
break
fi
done
}


function Update {
echo "Enter what you want to update"
read up
echo "Now enter the new value"
read new
sed -i 's/'"$up"'/'"$new"'/gp' $name 
}


function delete {
select h in All ByColumn
do
case $h in
All)
 sed -e '3,$d'$name > $name
 break;;
ByColumn)
 echo "enter the column num"
 read idcol
 if [ $idcol > $x ]; then
  echo "please enter an Existing column"
 else
  cut -d: -f$idcol --complement $name >> $name
 fi
 break;;
esac
done
}


function selectt {
select se in All ByColumn ByRow
do
case $se in
All)
 sed -n '3,$p' $name
 break;;
ByColumn)
 echo "enter the column num"
 read idcol
 cut -d: -f$idcol $name 
 break;;
ByRow)
 echo "enter the row num"
 read idcol
 sed -n '3,'"$idcol"'p' $name
 break;;
esac
done
}


while true
do
select choice in Create list Drop insert Delete update Select
do
case $choice in
Create)
echo "Enter table name"
read name
checkName
break;;
list)
cat $name 
break;;
Drop)
Drop
break;;
insert)
insert
break;;
update)
Update
break;;
Delete)
delete
break;;
Select)
selectt
break;;
esac
done
done

