#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

QUERY="SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements FULL JOIN properties USING(atomic_number) LEFT JOIN types USING(type_id)"

OUTPUT() {
  if [[ -z $RESULT ]]; then
    echo "I could not find that element in the database."
  else
    echo $RESULT | while read ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT BAR BOILING_POINT BAR TYPE; do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
}

if [[ -z $1 ]]; then
  echo "Please provide an element as an argument."
else
  # find atomic number
  if [[ $1 =~ ^[0-9]+$ ]]; then
    RESULT=$($PSQL "$QUERY WHERE atomic_number = $1")
    OUTPUT
  # find symbol
  elif [[ $1 =~ ^[A-Z][a-z]{0,1}$ ]]; then
    RESULT=$($PSQL "$QUERY WHERE symbol = '$1'")
    OUTPUT
  # find name
  elif [[ $1 =~ ^[A-Z][a-z]{2,}$ ]]; then
    RESULT=$($PSQL "$QUERY WHERE name = '$1'")
    OUTPUT
  else
    echo "I could not find that element in the database."
  fi
fi
