#!/bin/bash

mkdir $1
cd $1
touch main

domain=$1
path_to_save=$(pwd)
red=`tput setaf 1`
green=`tput setaf 2`
purple=`tput setaf 125`
reset=`tput sgr0`
bold=`tput bold`
start_time=`date +%s`

banner()
{
  echo "+------------------------------------------+"|lolcat
  printf "| %-40s |\n" "`date`"|lolcat
  echo "|                                          |"|lolcat
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"|lolcat
  echo "+------------------------------------------+"|lolcat
}

subdomain-recon()
{
banner "Finding Subdomains"
curl -s "https://jldc.me/anubis/subdomains/"$domain | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" >> main
assetfinder -subs-only $domain -silent | httpx -timeout 3 -threads 300 --follow-redirects -silent|anew main >> main
curl -s "https://crt.sh/?q=%25."$domain"&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' |anew main >> main
subfinder -d $domain|anew main >> main
amass enum -d $domain -passive|anew main >> main
findomain -t $domain -u main-findomain.txt
cat main-findomain.txt |anew main >> main
rm -f main-findomain.txt
echo ${green}"Done and results saved in"${reset} "==>" ${bold}${red} main ${reset}
tmp_var=$(cat main|wc -l)
echo ""
echo "Total" ${bold}${green}$tmp_var ${reset}"Subdomains Found"
echo ""
banner "Running httprobe on found list of subdomain"
sleep 1
cat main |httprobe > main-httprobed.txt
echo ""
sleep 1
tmp_var2=$(cat main-httprobed.txt|wc -l)
echo ${bold}${green}$tmp_var2 ${reset}"Subdomains are alive out of${reset}"${bold}${green} $tmp_var${reset}
end_time=`date +%s`
duration=$(expr $end_time - $start_time)
diff=$(expr $duration / 60)
echo "It took" ${bold}${green}$diff ${reset}"Minutes to complete the subdomain enumeration and verification!"
echo ""
}

subdomain-recon
