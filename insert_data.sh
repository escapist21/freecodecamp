#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    # get team_id from $WINNER
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team from $WINNER
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    # get team_id from $OPPONENT
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert team from $WINNER
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi  

    # get game_id
    GAME_ID=$($PSQL "SELECT game_id FROM games WHERE (year=$YEAR AND round=$ROUND AND winner_id=$WINNER_)")
  fi
done