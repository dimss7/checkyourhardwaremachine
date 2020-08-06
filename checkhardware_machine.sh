#!/usr/bin/env bash
# ------------------------------------------------------------------------ #
# Program:        checkyourhardware_machine.sh 
# Authored by:    Dims
# Inspired :      Mr.Amaury Souza
# ------------------------------------------------------------------------ #
# Usage:         
#       $ ./checkhardware__machine.sh
# ------------------------------------------------------------------------ #
# Bash Version:  
#              Bash 4.4.19
# ------------------------------------------------------------------------ #

program=Informations_Hardware_Machine
developer=Dims

echo ------------------------------------------------------------------------
echo "$program"
echo "Authored by $developer."
echo "Thx to https://pemula.linux.or.id/programming/bash-shell.html $thanks."
echo ------------------------------------------------------------------------

function menuprincipal () {
TIME=1
echo " "
echo $0
echo " "
echo "Choose an option below!

        1 - Check desktop processor
	2 - Check system kernel
	3 - Check OS version
       	4 - Check desktop memory
	5 - Check serial number
	6 - Check system Ip Adress	 
	7 - Out"
echo " "
echo -n "Chosen option: "
read opcao
case $opcao in
	1)
		function processador () {
			CPU_INFO=`cat /proc/cpuinfo | grep -i "^model name" | cut -d ":" -f2 | sed -n '1p'`
			echo "CPU model: $CPU_INFO"
			sleep $TIME
		}	
		processador
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	2)
		function kernel () {
			#RED HAT: cat /etc/redhat-release
			KERNEL_VERSION_UBUNTU=`uname -r`
			KERNEL_VERSION_CENTOS=`uname -r`
			if [ -f /etc/lsb-release ]
			then
				echo "kernel version: $KERNEL_VERSION_UBUNTU"
			else
				echo "kernel version: $KERNEL_VERSION_CENTOS"
			fi
		}
		kernel
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;
	
	3)
		function sistema () {
			VERSION=`cat /etc/os-release | grep -i ^PRETTY`
			if [ -f /etc/os-release ]
			then
				echo "The system version: $VERSION"
			else
				echo "System not supported"
			fi
		}
		sistema
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;


	4)
		function memory () {
			MEMORY_FREE=`free -m  | grep ^Mem | tr -s ' ' | cut -d ' ' -f 4`
			#MEMORY_TOTAL=
			#MEMORY_USED=
			echo Verifying system memory...
			echo "Memory free is: $MEMORY_FREE"	
		}
		memory
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	5)
		function serial () {
			SERIAL_NUMBER=`dmidecode -t 1 | grep -i serial`
			echo $SERIAL_NUMBER
		}
		serial
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	6)
		function ip () {
			IP_SISTEMA=`hostname -I`
			echo IP is: $IP_SISTEMA
		}
		ip
		read -n 1 -p "<Enter> for main menu"
		menuprincipal
		;;

	7) 
	       echo Exiting the system...
       	       sleep $TIME
	       exit 0
	       ;;

	*)
		echo Invalid option, try again!
		;;
esac
}
menuprincipal
