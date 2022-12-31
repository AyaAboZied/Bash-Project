echo "Enter table name"
read name
function checkName {
if [[ !($name =~ ^[A-Za-z]*$) ]];then
echo "invaild name"
return
else
for i in *
do
if [[ ($i != $name) ]]; then
 touch $name
else
 echo "already exist"
fi
done
fi
}

checkName

function insert {
echo "Enter number of feild"
read x
j=0
echo "Enter your column name,type *please seperate with : *"
while [[ $j -lt $x ]]
do
read col
echo $col  >> $name
let j=$j+1
ff=$(cut -d: -f1  $name )
for i in $ff
do
if [[ !($i =~ ^[0-9]*$) ]]; then
echo "sorry,${i} is invaild *please,Enter a number*"
sed -i '$d' $name > $name
return
fi
done
done
}

function Drop {
echo "please enter the name of table you want to remove"
read nm
rr=0
for i in *
do
if [[ $i = $name ]]; then
 rm -i $name
echo "Done removing"
let rr=$rr+2
break
fi
done
if [[ $rr<1 ]];then
echo "invalid"
fi
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
 sed -i -e '3,$d' $name > $name
 break;;
ByColumn)
 echo "enter the column num"
 read idcol
 if [[ $idcol > $x ]]; then
  echo "please enter an Existing column"
  echo $x
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
