#!/bin/bash

#this is a guessing game

name="$1"
if [[ -z "$name" ]];then  
    printf "usage: ./intro.sh <name>\n where name is the name of the user playing the game"
    exit 1
fi

start-time=$(date '+%Y-%m-%d %H:%M:%S')
start_sec=$(date +%s)
log_file="history.log"

echo "=========================="
echo "Hi $name, Welcome to our guessing game."
echo "==========================="


guess=-1
count=0
start_time=$(date '+%Y-%m-%d %H:%M:%S')
start_sec=$(date +%s)


level="${2,,}"

if [[ -z "$level" ]];then  
    printf "usage: ./intro.sh <level>\n where name is the desired level of the user playing the game"
    exit 1
fi

if [[ "$#" -gt 2 ]]; then
    echo "Error: incorrect level. "
    exit 1
fi

old_best=$(grep "^${name}|${level}|" "$log_file" | cut -d'|' -f5 | sort -n | head -n 1)
if [[ -z "$level" ]] || [[ "$level" == "normal" ]]; then
    max=100
    range="1-100"
    number=$(( RANDOM % $max + 1 ))
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
    range="0-50"
    number=$(( RANDOM % $max + 1 ))
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
    range="0 - 1000"
    number=$(( RANDOM % $max + 1 ))
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
    echo "a correct level please"
fi
end_time=$(date '+%Y-%m-%d %H:%M:%S')
end_second=$(date +%s)
duration=$(( $end_second - $start_sec ))

echo "${name}|${level}|${start_time}|${end_time}|${duration}" >> "$log_file"

echo "Performance summary"
if [ -z "$old_best" ]; then
    echo "First time playing $level level! Record saved"
elif  [[ $count -lt $old_best ]]; then
    echo "New personal best for $level level!"
else 
    echo "Your personal best of $level level is still $old_best tries."
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
