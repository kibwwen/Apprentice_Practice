#! /bin/bash

read -p "Enter two numbers:" num1 num2
echo $num1
echo $num2
read -p "Choose an arithmetic operation (+, -, *, /):" symbol

if [ "$symbol" == "+" ]
then
	sum=$((num1 + num2))
elif [ "$symbol" == "-" ]
then
	sum=$((num1 - num2))
elif [ "$symbol" == "*" ]
then
	sum=$((num1 * num2))
elif [ "$symbol" == "/" ]
then
	sum=$((num1 / num2))
else
	exit 1
fi

echo "The result:$sum"
