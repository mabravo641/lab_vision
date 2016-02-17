# Warmup Questions

1.  What is the clone url of this repository?
    >   https://github.com/mabravo641/lab_vision/

2.  What is the output of the ``cal`` command?

	The output of cal command is a calendar displayed in a traditional format. It showa 
	the present month and highlighted day

    Febrero 2016
do lu ma mi ju vi sá
    1  2  3  4  5  6
 7  8  9 10 11 12 13
14 15 16 17 18 19 20
21 22 23 24 25 26 27
28 29

# Homework Questions

1.  What is the ``grep``command?
    >   grep is used to search and print lines that contain some text specified or a pattern. 
	I checks either name of files or line by line in texts inside files looking for a match 
	of a given pattern. (%man grep)

2.  What is a *makefile*?
    >   Makefiles are special format files that help build and manage the projects automatically.
	A makefile is a file that describes the relationships between the files 
	in a program, and the states commands for updating each file. contains instructions for 
	the make program on compiling and linking programs. It facilitates the development of 
	large programs because it keeps track of changes in parts of said program, and only compiles 
	the parts that have changed. It is necesary to use make, at the begining, because it contains 
	the shell comands. (http://www.tutorialspoint.com/makefile/  &  %man make)

4.  What does the ``-prune`` option of ``find`` do? Give an example
    >   find is a function that search for files in a directory hierarchy. 
	Prune is a boolean function which is true if douring the search it doesn't go into 
	each directory's contents before the  directory  itself. And it is false if it does,
	this happens when -deph is given. Doing this we can ignore directories. (%man find)

	Example: find / -name *cfg* -prune | wc -l
	171	

	This example finds all other files that do not have cfg in their name and counts them

5.  Where is the ``grub.cfg``  file
    >   using the command: find / -name grub.cfg
	/usr/share/doc/grub-common/examples/grub.cfg

6.  How many files with ``gnu`` in its name are in ``/usr/src``
    >   using: find /usr/src -name gnu |wc -l
	0

7.  How many files contain the word ``gpl`` inside in ``/usr/src``
    >   using the command: find /usr/src "gpl" |wc -l
	49631

8.  What does the ``cut`` command do?
    >   Deleates sections of lines in files. It allows you to extract infomation of a file (%man cut)

9.  What does the ``wget`` command do?
    >   The non-interactive network downloader.Wget is non-interactive, meaning that it can work 
	in the background, while the user is not logged on.  This allows you to start a retrieval
	and disconnect from the system, letting Wget finish the work. (%man wget)

9.  What does the ``rsync`` command do?
    >   a file-copyng tool.  It can  copy  locally,  to/from  another  host  over  any remote shell, or
       to/from a remote rsync daemon. (%man rsync)

10.  What does the ``diff`` command do?
    >   diff finds the difference between two files line by line, by comparing its contents. It can also compare directories. 
	When comparing directories, diff compares the files in each directory in alphabetical order. 

10.  What does the ``tail`` command do?
    >   tail gives as output the last part of files  (%man tail)

10.  What does the ``tail -f`` command do?
    >   the -f option follows the file and adds the data as the file grows. (%man tail)

10.  What does the ``link`` command do?
    >   link command calls the link function to create a link to a file. (%man link)

11.  How many users exist in the course server?
    >   vision@ing-542:~$ users | wc -w
	3

12. What command will produce a table of Users and Shells sorted by shell (tip: using ``cut`` and ``sort``)
    >   cut -d : -f 1,7 /etc/passwd | sort -t : -k2 (

13. What command will produce the number of users with shell ``/sbin/nologin`` (tip: using ``grep`` and ``wc``)
    >   answer

15. Create a script for finding duplicate images based on their content (tip: hash or checksum)
    You may look in the internet for ideas, but please indicate the source of any code you use
    Save this script as ``find_duplicates.sh`` in this directory and commit your changes to github

16. What is the meaning of ``#! /bin/bash`` at the start of scripts?
    >   That is called a shebang, it tells the shell what program to interpret the script with, when executed.
	(http://stackoverflow.com/questions/13872048/bash-script-what-does-bin-bash-mean)

17. How many unique images are in the ``sipi_images`` database?
    >   301 (http://sipi.usc.edu/database/SIPI_Database.pdf)
    
