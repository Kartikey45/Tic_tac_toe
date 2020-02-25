#!/bin/bash -x

echo "*****************Welcome to Tic Tac Toe****************"

#INITIALIZE VARIABLES AND CONSTANTS
ROW_LIMIT=3
COLUMN_LIMIT=3
SIGN=0

#DECLARE 2-D DICTIONARY
declare -A board

#RESET THE BOARD
function boardReset()
{
	for((row=0; row<$ROW_LIMIT; row++))
	do
		for((column=0; column<$COLUMN_LIMIT; column++))
		do
			board[$row,$column]=" "
		done
	done
}

#LETTER ASSIGN TO THE PLAYER
function letterAssigned()
{
	letterCheck=$(( RANDOM%2 ))
	if [ $letterCheck -eq $SIGN ]
	then
		player=O
		computer=X
	else
		player=X
		computer=O
	fi
	echo $player
	echo $computer
}

#FUNCTIONS CALL
boardReset
letterAssigned
