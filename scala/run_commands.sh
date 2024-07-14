#!/bin/bash

while IFS= read -r command; do
    echo "Running command: $command"
    sbt "$command"
done < "scala_commands_augment_filter_agg.txt"
