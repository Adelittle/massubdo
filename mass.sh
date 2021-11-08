#!/bin/bash
RD="\e[91m"
GR="\e[92m"
CY="\e[96m"
YL="\e[93m"
BL="\e[94m"
NC="\e[0m"
clear
echo -ne "     Adelittle ft. FaizAzhar \n "
echo -ne "[${YL}?${NC}] Your Enter Your list = "
read list
if [[ ! -f $list ]]; then
	echo -e "[${RD}!${NC}] I can't find your fu*king list!"
	exit 1
fi


getting(){
	RD="\e[91m"
	GR="\e[92m"
	CY="\e[96m"
	YL="\e[93m"
	BL="\e[94m"
	NC="\e[0m"
	site=$1
	tnt=$(curl -s "https://exploit.anons79.com/sub.php" -H "user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36 Edg/95.0.1020.44" --data-raw "target=$site&scan=Scan" | grep -Po "(?<=href=')[^']*" | sed 's|[/,]||g' >> subdoscan.txt)
		cat subdoscan.txt
}
export -f getting
echo -e "===============[Let's Go!]==============="
sort -u $list | xargs -P 50 -n1 bash -c 'getting "$@"' _
