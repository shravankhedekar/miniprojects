#!/bin/bash

while true
do
    POD=$(kubectl get pods -o name | head -n 1)

    echo "Deleting $POD" #print

    kubectl delete $POD

    sleep 20
done