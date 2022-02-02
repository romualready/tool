#!bin/bash

clear

banner () {

printf "\e[0m\n"
printf "\e[0m\e[92m     /********  *******     *******     *******   **       ****     ** ******* \e[0m\e[93m\n"
printf "\e[0m\e[92m    /**//////**/**////**   **/////**   **/////** /**      /**/**   /**/**////** \e[0m\e[93m\n"
printf "\e[0m\e[92m   /**      // /**   /**  **     //** **     //**/**      /**//**  /**/**    /** \e[0m\e[93m\n"
printf "\e[0m\e[92m   /**         /*******  /**      /**/**      /**/**      /** //** /**/**    /** \e[0m\e[93m\n"
printf "\e[0m\e[92m   /**    *****/**///**  /**      /**/**      /**/**      /**  //**/**/**    /** \e[0m\e[93m\n"
printf "\e[0m\e[92m   //**  ////**/**  //** //**     ** //**     ** /**      /**   //****/**    ** \e[0m\e[93m\n"
printf "\e[0m\e[92m    //******** /**   //** //*******   //*******  /********/**    //***/******* \e[0m\e[93m\n"
printf "\e[0m\e[92m     ////////  //     //   ///////     ///////   //////// //      /// /////// \e[0m\e[93m\n"
}


Listening(){

clear

banner listening

read -p $"Which port do you want to use ? (Between 1500 and 65000 is better):" answer 

nc -lnvp "$answer"

}

Exit(){
banner 
printf "\e[0m\n"
printf " \e[0m\e[1;42m Thanks For Using This Tool !\e[0m  \e[1;44m Visit https://github.com/Groolndmpo42 if you want to contact me or/and see more !"
exit 1
}

Ping(){

clear

banner ping

read -p $"Ip local adress of the target :" iplocal

localip=$iplocal

read -p $"Port number :" portnumber

port=$portnumber

nc -v $localip $portnumber
}


menu() {
banner groolnd
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
banner groolnd
menu
fi
sleep 0.50
}

menu
