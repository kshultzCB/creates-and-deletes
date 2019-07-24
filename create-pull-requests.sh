#!/bin/bash
if [ -z "$1" ]
  then
    echo "No PREFIX supplied"
    exit
fi
PREFIX=$1
echo "Prefix for new branches will be $PREFIX"
git checkout master
for i in `seq 20 22`;
    do
        git checkout -b "$PREFIX-$i"
        echo "node () { " > Jenkinsfile
        echo "  echo \"Branch is $PREFIX-$i\"" >> Jenkinsfile
        echo "  sh \"netstat -a\" " >> Jenkinsfile
        echo "}" >> Jenkinsfile
        git add Jenkinsfile
        git commit -m "Commit iteration number $i for branch $PREFIX-$i"
        hub pull-request -p -m "Creating PR from branch $PREFIX-$i"
        echo "Sleep 2 seconds"
        sleep 2
    done 
