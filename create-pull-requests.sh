#!/bin/bash

for i in `seq 1 1`;
    do
        git checkout -b "automated-branch-$i"
        echo "node () { " > Jenkinsfile
        echo "  echo \"Hello from pass $i\"" >> Jenkinsfile
        echo "  sh \"netstat -a\" " >> Jenkinsfile
        echo "}" >> Jenkinsfile
        git add Jenkinsfile
        git commit -m "Creating commit for iteration $i"
        hub pull-request -p -m "command line pull request for iteration $i"
        echo "Sleep 30 seconds"
        # sleep 30
    done 
