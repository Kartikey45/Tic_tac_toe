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
	echo "player's letter : $player"
	echo "computer's letter : $computer"
}

#TO CHECK WHO PLAY FIRST
function tossBegin()
{
	tossCheck=$(( RANDOM%2 ))
	if [ $tossCheck -eq $SIGN ]
	then
		echo "player wins the toss"
	else
		echo "Computer wins the toss"
	fi
}

#DISPLAY THE BOARD
function board()
{
	echo "Empty board:"
	for((row=0; row<ROW_LIMIT; row++))
	do
		for((column=0; column<COLUMN_LIMIT; column++))
		do
			printf "|${board[$row,$column]}"
		done
		printf "|"
		echo
	done
}

#FUNCTIONS CALL
boardReset
letterAssigned
tossBegin
board
