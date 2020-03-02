#!/bin/bash -x

echo "*****************Welcome to Tic Tac Toe****************"

#INITIALIZE VARIABLES AND CONSTANTS
ROW_LIMIT=3
COLUMN_LIMIT=3
SIGN=0
firstMove=1
lastMove=9
count=0

#DECLARE THE DICTIONARY
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
		contestant=$player
	else
		echo "Computer wins the toss"
		contestant=$computer
	fi
}

#DISPLAY THE BOARD
function displayBoard()
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

#PLAYER CHOOSE THE CELLS TO FILL THE BOARD
function cellChooseByBothPlayers()
{
	for((turn=$firstMove; turn<=$lastMove; turn++))
	do
		read -p "User has to choose row to insert the value :" row
		read -p "User has to choose column to insert the value :" column
		board[$row,$column]=$player
		cellChooseByComputer
		displayBoard
		row=0
		column=0
		if [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$(($row+1)),$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+1)),$(($column+2))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$(($row+1)),$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+1)),$(($column+2))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$(($row+2)),$column]}${board[$(($row+2)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$(($row+2)),$column]}${board[$(($row+2)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$row,$(($column+1))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+1))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$(($column+1))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+1))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "computer Wins !!!"
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+2))]}${board[$(($row+2)),$(($column+2))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+2))]}${board[$(($row+2)),$(($column+2))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $player$player$player ]]
		then
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$column]} == $player$player$player ]]
		then 
			(( count++ ))
			echo "Player Wins !!!"
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$column]} == $computer$computer$computer ]]
		then
			(( count++ ))
			echo "Computer Wins !!!"
			break
		fi
	done
	if [ $count -eq 0 ]
	then
		echo "Tie !!!"
		break
	fi
}

#COMPUTER CHOOSE THE CELLS TO FILL THE BOARD
function cellChooseByComputer()
{
	echo "Computer has to choose the cell :"
	random=$(( RANDOM%9+1 ))
	case $random in 
		1)
		board[0,0]=$computer
		;;
		2)
		board[0,1]=$computer
		;;
		3)
		board[0,2]=$computer
		;;
		4)
		board[1,0]=$computer
		;;
		5)
		board[1,1]=$computer
		;;
		6)
		board[1,2]=$computer
		;;
		7)
		board[2,0]=$computer
		;;
		8)
		board[2,1]=$computer
		;;
		9)
		board[2,2]=$computer
		;;
		*)
		echo "invalid"
		;;
	esac
}

#FUNCTIONS CALL
boardReset
letterAssigned
tossBegin
cellChooseByBothPlayers
