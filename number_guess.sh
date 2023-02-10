#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS(){
  read GUESS_NUMBER 
  if [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
  then
    while [[ $THE_NUMBER == "NOT FOUND" ]]
    do   
      ONE_TRY $RANDOM_NUMBER $GUESS_NUMBER
    done
  else
    echo "That is not an integer, guess again:"
    GUESS
  fi

}

ONE_TRY(){
  
  if [ $1 -lt $2 ]
  then
  echo "It's lower than that, guess again:"
    ((TRIES++))
    GUESS
  
  elif [ $1 -gt $2 ]
  then 
    echo "It's higher than that, guess again:"
    ((TRIES++))  
    GUESS
   
  elif [ $1 -eq $2 ]
  then
    ((TRIES++))
    echo "You guessed it in $TRIES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    THE_NUMBER="FOUND"
    ADD_GAMES=$($PSQL "UPDATE stats SET attempts = attempts + 1 WHERE name = '$USER_NAME'")
    ADD_BEST_GAMES=$($PSQL "UPDATE stats SET best_score = $TRIES WHERE name = '$USER_NAME'")
    
  fi
}

GUESSING_GAME() {
TRIES=0
THE_NUMBER="NOT FOUND"
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

echo "Enter your username:"
read USER_NAME
USER=$($PSQL "SELECT name, attempts, best_score FROM stats WHERE name='$USER_NAME'")
if [[ -z $USER ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  ADD_USER=$($PSQL "INSERT INTO stats(name, attempts, best_score) VALUES('$USER_NAME', '0', '0')")
  echo "Guess the secret number between 1 and 1000:"
  GUESS
    
else
  IFS="|" read USERNAME GAMES_PLAYED BEST_GAME <<< $USER
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  echo "Guess the secret number between 1 and 1000:"
  GUESS 
fi  
}

GUESSING_GAME
