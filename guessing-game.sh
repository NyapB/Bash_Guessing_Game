#!/bin/bash

#this is a guessing game

name="$1"
if [[ -z "$name" ]];then  
    printf "usage: ./intro.sh <name>\n where name is the name of the user playing the game"
    exit 1
fi


echo "=========================="
echo "Hi $name, Welcome to our guessing game."
echo "==========================="

number=$(( RANDOM % $max + 1 ))
guess=-1
count=0

level="${2,,}"
if [[ -z "$level" ]];then  
    printf "usage: ./intro.sh <level>\n where name is the desired level of the user playing the game"
    exit 1
fi

if [[ "$#" -gt 2 ]]; then
    echo "Error: incorrect level. "
    exit 1
fi


if [[ -z "$level" ]] || [[ "$level" == "normal" ]]; then
    max=100
while (( guess != number )); do
        read -r -p "Please guess a number between 0 and 100: " guess

        if [[ -z "$guess" ]]; then
            echo "Please enter a number: "
            exit 1;
        elif (( guess > number)); then
            echo "Your guess is higher than the number"
        elif (( guess < number )); then
            echo "Your guess is lower than the number"   
        fi
        ((count++))
done


elif [[ "$level" == "easy" ]]; then
    max=50
while (( guess != number )); do
    read -r -p "Please guess a number between 0 and 50: " guess

    if [[ -z "$guess" ]]; then
        echo "Please enter a number: "
        exit 1;
    elif (( guess > number)); then
        echo "Your guess is higher than the number"
    elif (( guess < number )); then
        echo "Your guess is lower than the number"   
    fi
    ((count++))
done


elif [[ "$level" == "hard" ]]; then
    max=1000
while (( guess != number )); do
    read -r -p "Please guess a number between 0 and 1000: " guess

    if [[ -z "$guess" ]]; then
        echo "Please enter a number: "
        exit 1;
    elif (( guess > number)); then
        echo "Your guess is higher than the number"
    elif (( guess < number )); then
        echo "Your guess is lower than the number"   
    fi
    ((count++))
done
else 
    echo "a correct levelp lease"
fi








# while (( guess != number )); do
#     read -r -p "Please guess a number between 0 and 100: " guess

#     if [[ -z "$guess" ]]; then
#         echo "Please enter a number: "
#         exit 1;
#     elif (( guess > number)); then
#         echo "Your guess is higher than the number"
#     elif (( guess < number )); then
#         echo "Your guess is lower than the number"   
#     fi
#     ((count++))
# done

    echo "Congratulations!! you guessed correctly after trying $count number time(s)"
