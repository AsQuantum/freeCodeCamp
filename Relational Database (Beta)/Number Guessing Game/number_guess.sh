#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"
read USERNAME

# username validity
if [[ $USERNAME =~ ^.{1,25}$ ]]; then
  USERNAME_RESULT=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$USERNAME'")
  # username first play
  if [[ -z $USERNAME_RESULT ]]; then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    INSERT_USERNAME=true
  else
    USERNAME_RESULT=$(echo $USERNAME_RESULT | sed 's/|/ | /g')
    echo "$USERNAME_RESULT" | while read USERNAME BAR GAMES_PLAYED BAR BEST_GAME; do
      echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
    done
  fi
  # guess number
  NUMBER=$(( RANDOM % 1000 + 1 ))
  echo -e "\nGuess the secret number between 1 and 1000:"
  read GUESS
  NEW_BEST_GAME=1
  while [[ $GUESS != $NUMBER ]]; do
    if [[ $GUESS =~ ^[0-9]+$ ]]; then
      if [[ $GUESS -gt $NUMBER ]]; then
        echo -e "\nIt's lower than that, guess again:"
      elif [[ $GUESS -lt $NUMBER ]]; then
        echo -e "\nIt's higher than that, guess again:"
      fi
    else
      echo -e "\nThat is not an integer, guess again:"
    fi
    (( NEW_BEST_GAME++ ))
    read GUESS
  done
  # finish guess
  echo -e "\nYou guessed it in $NEW_BEST_GAME tries. The secret number was $NUMBER. Nice job!"
  if [[ $INSERT_USERNAME == true ]]; then
    INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  fi
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USERNAME'")
  if [[ -z $BEST_GAME  ]]; then
    UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NEW_BEST_GAME WHERE username='$USERNAME'")
  elif [[ $NEW_BEST_GAME < $BEST_GAME ]]; then
    UPDATE_BEST_GAME_RESULT=$($PSQL "UPDATE users SET best_game = $NEW_BEST_GAME WHERE username='$USERNAME'")
  fi
  UPDATE_GAMES_PLAYED_RESULT=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'")
else
  echo "Invalid username"
fi
