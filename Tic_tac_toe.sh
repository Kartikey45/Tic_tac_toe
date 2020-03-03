#!/bin/bash -x

echo "*****************Welcome to Tic Tac Toe****************"

#INITIALIZE VARIABLES AND CONSTANTS
ROW_LIMIT=3
COLUMN_LIMIT=3
SIGN=0
firstMove=1
lastMove=9
isEmpty=" "
ROWS=3
COLUMNS=3
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
		column=0
		for((row=0; row<$ROWS; row++))
		do
			if [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $player$player$player ]]
			then
				echo "Player Wins !!!"
				(( count++ ))
				break
			elif [[ ${board[$row,$column]}${board[$row,$(($column+1))]}${board[$row,$(($column+2))]} == $computer$computer$computer ]]
			then
				echo "Computer Wins !!!"
				(( count++ ))
				break
			fi
		done
		row=0
		for((column=0; column<$COLUMNS; column++))
		do
			if [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $player$player$player ]]
			then
				echo "Player Wins !!!"
				(( count++ ))
				break
			elif [[ ${board[$row,$column]}${board[$(($row+1)),$column]}${board[$(($row+2)),$column]} == $computer$computer$computer ]]
			then
				echo "Computer Wins !!!"
				(( count++ ))
				break
			fi
		done
		row=0
		column=0
		if [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $player$player$player ]]
		then
			echo "Player Wins !!!"
			(( count++ ))
			break
		elif [[ ${board[$row,$column]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$(($column+2))]} == $computer$computer$computer ]]
		then
			echo "Computer Wins !!!"
			(( count++ ))
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$column]} == $player$player$player ]]
		then
			echo "Player Wins !!!"
			(( count++ ))
			break
		elif [[ ${board[$row,$(($column+2))]}${board[$(($row+1)),$(($column+1))]}${board[$(($row+2)),$column]} == $computer$computer$computer ]]
		then
			echo "Computer Wins !!!"
			(( count++ ))
			break
		fi
		if [ $count -eq 1 ]
		then
			break
		fi
	done
	if [ $count -ne 1 ]
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
		if [[ ${board[0,0]} == $isEmpty ]]
		then
			board[0,0]=$computer
		fi
		;;
		2)
		if [[ ${board[0,1]} == $isEmpty ]]
		then
			board[0,1]=$computer
		fi
		;;
		3)
		if [[ ${board[0,2]} == $isEmpty ]]
		then
			board[0,2]=$computer
		fi
		;;
		4)
		if [[ ${board[1,0]} == $isEmpty ]]
		then
			board[1,0]=$computer
		fi
		;;
		5)
		if [[ ${board[1,1]} == $isEmpty ]]
		then
			board[1,1]=$computer
		fi
		;;
		6)
		if [[ ${board[1,2]} == $isEmpty ]]
		then
			board[1,2]=$computer
		fi
		;;
		7)
		if [[ ${board[2,0]} == $isEmpty ]]
		then
			board[2,0]=$computer
		fi
		;;
		8)
		if [[ ${board[2,1]} == $isEmpty ]]
		then
			board[2,1]=$computer
		fi
		;;
		9)
		if [[ ${board[2,2]} == $isEmpty ]]
		then
			board[2,2]=$computer
		fi
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
