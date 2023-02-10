#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only --no-align -c"

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
elif [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOM_NUM=$1
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOM_NUM")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$NAME'")
    TYPE=$($PSQL "SELECT type FROM types RIGHT JOIN properties USING(type_id) WHERE atomic_number=$ATOM_NUM")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOM_NUM")
    MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    echo -e "The element with atomic number $ATOM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
else
  SYMBOL=$1
  NM=$($PSQL "SELECT name FROM elements WHERE symbol='$SYMBOL'")
  ATOM_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
  if [[ ! -z $NM ]]
  then
    ATOM_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name='$NM'")
    TYPE=$($PSQL "SELECT type FROM types RIGHT JOIN properties USING(type_id) WHERE atomic_number=$ATOM_NUM")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOM_NUM")
    MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    echo -e "The element with atomic number $ATOM_NUM is $NM ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NM has a melting point of $MP celsius and a boiling point of $BP celsius."
  fi

  if [[ ! -z $ATOM_NUM ]] && [[ -z $NM ]]
  then
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOM_NUM")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE name='$NAME'")
    TYPE=$($PSQL "SELECT type FROM types RIGHT JOIN properties USING(type_id) WHERE atomic_number=$ATOM_NUM")
    MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOM_NUM")
    MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOM_NUM")
    echo -e "The element with atomic number $ATOM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
  fi

  if [[ -z $ATOM_NUM ]] && [[ -z $NM ]]
  then
    echo -e "I could not find that element in the database."
  fi
fi
