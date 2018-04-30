#!/bin/bash

# Making Maze for Assignment03 - 16S
# May 26th, 2016

# Might be used in the future
# shuf4="$(shuf -i 1-4 -n 1)"

# Making some variables
line="$(wc -l userList.txt | awk '{print $1}')"
shuf="$(shuf -i 0-9 -n 1)"
rand="$(rand -N $(shuf -i 0-5 -n 1))" 
ranDot="$(rand -d . -N $(shuf -i 0-5 -n 1))"

# Making an array to make 10 Directories
dir='{0,1,2,3,4,5,6,7,8,9}'

# Making the Directory structure
eval mkdir -p $HOME/mazetest/Maze/.$dir/.$dir/.$dir/.$dir

# A for loop to select a user for each user
for (( i = 1 ; i <= $line ; i++ )) ; do
	user="$(head -n $i userList.txt | tail -n 1)"
	echo "$i" > Maze/.$shuf/.$shuf/.$shuf/.$user.unk
	echo "This is not the file, pay closer attention to the INSTRUCTIONS." > Maze/.$shuf/.$shuf/..$user.unk
	echo -e "Congrats on finding the correct file.\nWrite a command to find all the files that contain your username.\nWrite a Command that finds only files with your username in them where the name begins with a space.\nWrite a Command that finds only hidden files with your username in them.\nWrite a Command that finds only your username in a hidden file that ends with and unknown three character file extension.\nWrite the commands you used to find the files above in a file named A4-7.txt" > Maze/.$shuf/.$shuf/.$shuf/.$shuf/"$user*txt"

	# A for loop to make the maze
	for (( counter = 1 ; counter <= 200 ; counter++ )) ; do
		if (( "$counter" % 5 == 0 )) ; then
			touch Maze/.$shuf/.$shuf/.$shuf/.$shuf/"$rand $user $rand"
		elif (( "$counter" % 3 == 0 )) ; then
			touch Maze/.$shuf/.$shuf/.$shuf/\ "$rand $user $rand"
		elif (( "$counter" % 2 == 0 )) ; then
			touch Maze/.$shuf/.$shuf/."$ranDot.$user.$ranDot.NO"
			touch Maze/.$shuf/.$shuf/."$ranDot.$user.$ranDot.RTFM"
		else
			touch Maze/"$rand $rand"
			touch Maze/.$shuf/"$rand $rand"
		fi
	done
done
