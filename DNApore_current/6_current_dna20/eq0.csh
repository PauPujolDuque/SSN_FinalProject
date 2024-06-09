#!/bin/csh

#$ -e log-local-err.log
#$ -o log-local-out.log
#$ -cwd


namd2  eq0.namd >! eq0.log

exit 0
