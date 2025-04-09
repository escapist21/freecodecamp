#!/bin/bash
# Script to schedule appointments at the salon

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

MAIN_MENU(){
  if [[ $1 ]]
  then
    echo $1
  fi

  echo -e "Welcome to My Salon, how can I help you?\n"
  # get available services
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  # read selected service
  read SERVICE_ID_SELECTED
  # customer input not numerical 
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then 
    # send back to main menu
    MAIN_MENU "This is not a valid service number"
  else
    GET_SERVICE_ID_SELECTED=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # if selected service not found
    if [[ -z $GET_SERVICE_ID_SELECTED ]]
    then
      # send back to main menu
      MAIN_MENU "I could not find that service. What would you like today?"
    else
      # get service name
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$GET_SERVICE_ID_SELECTED")
      # get customer phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # check if customer phone number exists
      CUSTOMER_DETAILS=$($PSQL "SELECT phone, name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_DETAILS ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        # register new customer
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME') ")
      fi
      # get cutomer name
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # get appoinment time
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      # register new appointment
      INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) 
      VALUES ($CUSTOMER_ID, $GET_SERVICE_ID_SELECTED, '$SERVICE_TIME')")
      # print confirmaion
      echo -e "\nI have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//') at $(echo $SERVICE_TIME | sed -E 's/^ *| *$//'), $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//')."
    fi
  fi
}

MAIN_MENU