#!/bin/bash

for file in $(git ls-tree -r HEAD --name-only);do
	echo -n "$file  "
	git rev-parse HEAD "$file"
done

