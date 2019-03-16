#!/bin/bash
#www.github.com/echobash
while :
do
clear
echo -e "\e[96m welcome to phone directory \e[0m"
echo "1. add contact"
echo "2. Search Contacts"
echo "3. Delete Contacts"
echo "4. View Phone Directory"
echo "5. Quit"
echo "Enter Your Response"
read choice
clear
#echo $choice

case $choice in
1) echo -e "\e[96m Add Contact \e[0m"
   read -p "enter name" name
   echo "got it"
   read -p "enter number" number
   sleep 1
   echo -e "\e[32m Saved Successfully \e[0m"
   echo -e "\e[45m New Contact \e[0m"
   echo -e "\e[96m Name \e[0m : $name \e[0m    \e[96mNumber \e[0m : $number \e[0m "
   echo "$name	$number" >> phone.log;
;;
2) echo -e "\e[96m Search Contact \e[0m"
   read -p "search name (case sensitive)"  search_name
   clear
   echo -e "\e[96m Contact Found \e[0m"
   cat phone.log|grep -i $search_name
#   grep -i $search_name phone.log
;;
3) echo -e "\e[96m Delete Contact \e[0m"
   read -p "delete (case sensitive)" delete_contact
   sed -i -e "/$delete_contact/d" phone.log
;;
4) echo -e "\e[96m Saved Contacts \e[0m"
   cat phone.log
;;
5) break;;
*) echo "INVALID CHOICE";;
esac;
read -p "press 5 to exit and Anything else to continue" exit_choice
if [ $exit_choice -eq 5 ]
then break
fi
done
