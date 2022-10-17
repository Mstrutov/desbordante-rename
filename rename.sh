#!/bin/bash

cd tests
while ((i++)); renames=$(stdrename -sqr .) && git mv $renames
do
    echo $i
    renames=($renames)
    old_name=$(echo "${renames[0]}" | rev | cut -d / --fields 1 | rev)
    new_name=$(echo "${renames[1]}" | rev | cut -d / --fields 1 | rev)
     
    find . -type f -exec sed -i "s/$old_name/$new_name/g" {} +
    cd ../src
    find . -type f -exec sed -i "s/$old_name/$new_name/g" {} +
    cd ../tests
done
