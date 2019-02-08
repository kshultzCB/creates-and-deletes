#!/bin/bash

git checkout master
for i in `seq 1 5`;
    do
        git push --delete origin "automated-branch-$i"
        git branch -D "automated-branch-$i"
    done 
