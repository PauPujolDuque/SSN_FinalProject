#!/bin/csh

#$ -e log-local-err.log
#$ -o log-local-out.log
#$ -cwd


namd2  eq1.namd >! eq1.log

exit 0
