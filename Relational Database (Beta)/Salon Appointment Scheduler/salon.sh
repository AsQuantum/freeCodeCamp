#! /bin/bash

PSQL="psql --username=postgres --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~"

MAIN_MENU() {
  # display service
  MENU=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$MENU" | while read SERVICE_ID BAR NAME; do
    echo "$SERVICE_ID) $NAME"
  done
  # read selected service
  read SERVICE_ID_SELECTED
  # if selected service is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    # return to main menu
    echo -e "\nI could not find that service. What would you like today?"
    MAIN_MENU
  else
    # find selected service
    SERVICE_ID=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    # if not found
    if [[ -z $SERVICE_ID ]]; then
      # return to main menu
      echo -e "\nI could not find that service. What would you like today?"
      MAIN_MENU
    else
      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID")
      # read customer phone number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      PHONE=$($PSQL "SELECT phone FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # if not found
      if [[ -z $PHONE ]]; then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        # read customer name
        read CUSTOMER_NAME
        # insert customer information
        INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      fi
      # find customer_id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      # read customer appointment time
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      SERVICE_NAME=$(echo $SERVICE_NAME | sed -r 's\^ *| *$\\')
      CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed -r 's\^ *| *$\\')
      echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      # insert appointment
      INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID, $CUSTOMER_ID, '$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

echo -e "\nWelcome to My Salon, how can I help you?"
MAIN_MENU
