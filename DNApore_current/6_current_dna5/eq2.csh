#!/bin/csh

#$ -e log-local-err.log
#$ -o log-local-out.log
#$ -cwd


namd2  eq2.namd >! eq2.log

exit 0
