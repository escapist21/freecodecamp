#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
# generate random number between 1 and 1000
RANDOM_NUMBER=$(($RANDOM % 1000 + 1))

# get username from user
echo -e "\nEnter your username:"
read USERNAME

# query user in db
CHECK_USERNAME=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
# if username does not exist
if [[ -z $CHECK_USERNAME ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  # insert new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
  GET_NEW_USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  # insert new game stats
  INSERT_USER_STAT=$($PSQL "INSERT INTO game_stats(user_id, games_played, best_game) VALUES($GET_NEW_USER_ID, 0, 0)")
fi
# get user and game stats
GET_USER=$($PSQL "SELECT user_id, username, games_played, best_game FROM users INNER JOIN game_stats USING(user_id) WHERE username='$USERNAME'")
# format CHECK_USERNAME
IFS="|" read -r USER_ID USERNAME GAMES_PLAYED BEST_GAME <<<"$(echo $GET_USER | sed 's/|/|/g')"
USER_ID=$(echo $USER_ID | xargs)
USERNAME=$(echo $USERNAME | xargs)
GAMES_PLAYED=$(echo $GAMES_PLAYED | xargs)
BEST_GAME=$(echo $BEST_GAME | xargs)

echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# get guess from user
echo -e "\nGuess the secret number between 1 and 1000:"

NUMBER_OF_GUESSES=0

GUESS_NUMBER() {
  read USERGUESS
  ((NUMBER_OF_GUESSES++))
  # check if the guess is numeric
  if [[ ! $USERGUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    GUESS_NUMBER
  else
    if [[ $USERGUESS -eq $RANDOM_NUMBER ]]
      then
        echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        # check if game stats exist for user
        GET_GAME_STATS=$($PSQL "SELECT * FROM game_stats WHERE user_id=$USER_ID")
        # update user stats
        UPDATE_GAME_STATS=$($PSQL "UPDATE game_stats SET games_played = games_played + 1, best_game = CASE WHEN best_game = 0 THEN $NUMBER_OF_GUESSES ELSE LEAST(best_game, $NUMBER_OF_GUESSES) END WHERE user_id=$USER_ID")
      else
        if [[ $USERGUESS -gt RANDOM_NUMBER ]]
        then
          echo -e "\nIt's lower than that, guess again:"
          GUESS_NUMBER
        else
          echo -e "\nIt's higher than that, guess again:"
          GUESS_NUMBER
        fi
    fi
  fi      
}

GUESS_NUMBER
