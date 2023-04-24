#! /bin/bash

read -p  "Enter two number:" num1 num2
echo $num1
echo $num2
read -p "Choose an arithmetic operation (+, -, *, /):" symbol

case $symbol in
	"+")
		sum=$((num1 + num2))
		;;
	"-")
		sum=$((num1 - num2))
		;;
	"*")
		sum=$((num1 * num2))
		;;
	"/")
		sum=$((num1 / num2))
		;;
esac

echo "The result:$sum"
