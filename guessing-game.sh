#!/bin/bash

#this is a guessing game

name="$1"
if [[ -z "$name" ]];then  
    printf "usage: ./intro.sh <name>\n where name is the name of the user playing the game"
    exit 1
fi


echo "=========================="
echo "Hi $name, Welcome to our guessing game"
echo "==========================="

number=$(( RANDOM % 100 + 1 ))
guess=-1
count=0




while (( $guess != number)); do
    read -p "Please guess a number between 0 and 100: " guess

    if [[ -z "$guess" ]]; then
        echo "Please enter a number: "
        exit 1;
    elif (( $guess > $number)); then
        echo "Your guess is higher than the number"
    elif (( $guess < $number )); then
        echo "Your guess is lower than the number"   
    fi
    ((count++))
done

    echo "Congratulations!! you guessed correctly after trying $count number time(s)"
