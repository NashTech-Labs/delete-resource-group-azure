#!/bin/sh

set -o errexit
# set -o xtrace  # used for debugging

echo "Delete resource group"

echo "Enter Resource Group Name:"
read rg_name

echo "Check if resource group exists"
rg_exists=$(az group exists \
    --name $rg_name)

if [ $rg_exists ]
then
    echo "Resource Group Exists \nDeleting Resource Group"

    result=$(az group delete \
        --name $rg_name \
        --yes)
else
    echo "Resource Group not exists"
    exit 1
fi

status=$?

[ $status -eq 0 ] && echo "Resource Group Deleted" || echo "Error deleting Resource Group \n $result"