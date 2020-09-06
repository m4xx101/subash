#!/bin/bash
domain=$1
path_to_save=$2
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
curl -s "https://jldc.me/anubis/subdomains/"$domain | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" > $path_to_save
assetfinder -subs-only $domain -silent | httpx -timeout 3 -threads 300 --follow-redirects -silent|anew $path_to_save|tee -a $passive
curl -s "https://crt.sh/?q=%25."$domain"&output=json" | jq -r '.[].name_value' | sed 's/\*\.//g' |anew $path_to_save|tee -a $passive
subfinder -d $domain|anew $path_to_save|tee -a $passive
amass enum -d $domain -passive|anew $path_to_save|tee -a $passive
findomain -t $domain -u $path_to_save-findomain.txt
cat $path_to_save-findomain.txt |anew $path_to_save|tee -a $passive
rm -f $path_to_save-findomain.txt
echo ${green}"Done and results saved in"${reset} "==>" ${bold}${red}$path_to_save ${reset}
tmp_var=$(cat $path_to_save|wc -l)
echo ""
echo "Total" ${bold}${green}$tmp_var ${reset}"Subdomains Found"
echo ""
banner "Running httprobe on found list of subdomain"
sleep 1
cat $path_to_save |httprobe > $path_to_save-httprobed.txt
echo ""
sleep 1
tmp_var2=$(cat $path_to_save-httprobed.txt|wc -l)
echo ${bold}${green}$tmp_var2 ${reset}"Subdomains are alive out of${reset}"${bold}${green} $tmp_var${reset}
end_time=`date +%s`
duration=$(expr $end_time - $start_time)
diff=$(expr $duration / 60)
echo "It took" ${bold}${green}$diff ${reset}"Minutes to complete the subdomain enumeration and verification!"
echo ""
}

subdomain-recon
