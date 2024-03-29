#!/bin/bash
#
# Destroys the initial VM tempalte created with ./create-inital-vm-template.sh script
#
# Usage:
#  $ ./destroy-initia-vm-template.sh
#
set -e
MAIN_MSGCOLOR=`tput setaf 48`
MSGCOLOR=`tput setaf 3`
NOCOLOR=`tput sgr0`
ERRCOLOR=`tput setaf 196`

if [ -z ${Pz_VM_TEMPLATE_ID} ]; then
   printf "${ERRCOLOR}Pz_VM_TEMPLATE_ID is not set\n${NOCOLOR}"
   exit 1
fi

main_msg="${MAIN_MSGCOLOR}========Destroying VM Template with ID=${Pz_VM_TEMPLATE_ID}${NOCOLOR}"
printf "$main_msg...\n"
if grep -q "\"${Pz_VM_TEMPLATE_ID}\"" /etc/pve/.vmlist ; then
  qm destroy $Pz_VM_TEMPLATE_ID --destroy-unreferenced-disks --purge
fi
printf "$main_msg: done\n"
