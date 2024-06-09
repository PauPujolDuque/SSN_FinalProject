#!/bin/csh

#$ -e log-local-err.log
#$ -o log-local-out.log
#$ -cwd


namd2  eq3.namd >! eq3.log

exit 0
