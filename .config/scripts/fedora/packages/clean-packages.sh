#!/bin/bash

# This will clean any pacakges that are no longer installed on the machine.
config_file=~/.config/scripts/fedora/packages/fedora-install-packages.txt
temp_file=~/.config/scripts/fedora/packages/tmp.txt
list_file=~/.config/scripts/fedora/packages/list.txt

touch $temp_file
touch $list_file

echo $(sudo dnf list installed) > $list_file

while read -r line; do
    if grep -q $line $list_file; then
        echo $line >> $temp_file
    fi
done < $config_file

rm $config_file $list_file
mv $temp_file $config_file
