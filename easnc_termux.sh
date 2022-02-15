#!bin/bash

clear

Listening(){

clear

read -p $"Which port do you want to use ? (Between 1500 and 65000 is better):" answer 

nc -lnvp "$answer"

}

Send() {

clear
banner send
read -p $"Write the name of your file :" filename
read -p $"What port do you want to use ? :" portnumber
sleep 1
printf "\e[0m\n"
printf "Now the target must type this command 'nc -v yourip yourport' or the target can use this tool by choosing the rec>cat $filename | nc -lnvp $portnumber
}

Chatting() {

clear
banner groolnd

printf "\e[0m\n"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Host \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Join \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Back \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Exit \e[0m\n"
echo ""
read -p $'\e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' options

if [[ $options = 1 || $options = 01 ]]; then
sleep 1
Listening
elif [[ $options = 2 || $options = 02 ]]; then
sleep 1
Ping
elif [[ $options = 3 || $options = 03 ]]; then
sleep 1
menu
elif [[ $options = 4 || $options = 04 ]]; then
sleep 1
Exit
else
printf "Wrong answer"
sleep 2.5
Chatting
fi
sleep 0.5
}

File() {
clear
banner groolnd

printf "\e[0m\n"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Send \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Receive \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Back \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Exit \e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' option

if [[ $option = 1 || $option = 01 ]]; then
sleep 1
Send
elif [[ $option = 2 || $option = 02 ]]; then
sleep 1
Receive
elif [[ $option = 3 || $option = 03 ]]; then
sleep 1
menu
elif [[ $option = 4 || $option = 04 ]]; then
sleep 1
Exit
else
sleep 0.25
printf "Wrong answer"
sleep 1
File
fi
sleep 0.50
}


Receive() {

clear
banner receive
printf "note that the sender have to send first else there will be an error \n"
printf "\e[0m\n"
read -p $"Type the local ip adress of the sender :" ipadress
read -p $"Type the port number :" portt
sleep 1
nc -v $ipadress $portt
}

Exit(){
printf "\e[0m\n"
printf " \e[0m\e[1;42m Thanks For Using This Tool !\e[0m  \e[1;44m Visit https://github.com/Groolndmpo42 if you want to contact me or/and see more !"
exit 1
}

Ping(){

clear

read -p $"Ip local adress of the target :" iplocal

localip=$iplocal

read -p $"Port number :" portnumber

port=$portnumber

nc -v $localip $portnumber
}


menu() {
printf "     \e[0m\e[1;46m[+] How would you like to use Netcat ? [+]\e[0m\n"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Listening \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Ping \e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Exit \e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' menu_option

if [[ $menu_option = 1 || $menu_option == 01 ]]; then
Listening
elif [[ $menu_option = 2 || $menu_option ==  02 ]]; then 
Ping
elif [[ $menu_option = 3 || $menu_option == 03 ]];  then
Exit
else 
printf "\e[0m\n"
printf " \e[1;31m[!] Invalid Option \n"
printf "\e[0m\n"
sleep 1
clear
menu
fi
sleep 0.50
}

menu
