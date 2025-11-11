temp=`sensors | grep "Package" | tr -s " " ":" | cut -f4 -d":" | cut -c-3 | cut -c2-`
echo $temp
