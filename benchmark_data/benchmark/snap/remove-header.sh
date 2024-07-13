#!/bin/bash

for file in ./*.txt; do
	cat $file | sed '/^#/d' > noheader/$(basename $file)
done
