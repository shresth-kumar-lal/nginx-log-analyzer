#!/bin/bash

# file="$(pwd)/example-nginx-access.log" # sample for testing purpose
file="/var/log/nginx/access.log"

GREEN='\e[32m'
YELLOW='\e[33m'
RED='\e[31m'
BLUE='\e[34m'
BOLD='\e[1m'
RESET='\e[0m'

FEATURES() {
    echo -e "${BOLD}\nFeatures:${RESET}"
    echo -e "${BLUE}1. Top n IP addresses with most requests${RESET}"
    echo -e "${BLUE}2. Top n most requested paths${RESET}"
    echo -e "${BLUE}3. Top n response status codes${RESET}"
    echo -e "${BLUE}4. Top n user agents${RESET}"
    echo -e "${YELLOW}C. Clear screen${RESET}"
    echo -e "${RED}Q. Quit${RESET}\n"
}

PROMPT_NUMBER() {
    echo -e "${YELLOW}Enter the number:${RESET}"
    read -r n
}

IP_ADDR() {
    PROMPT_NUMBER
    ip_address=$(awk '{print $1}' $file | sort | uniq -c | sort -nr | head -n $n | awk '{printf "%-20s %s\n", $2, $1}')
    echo -e "\n${GREEN}Top $n IP addresses:${RESET}\n$ip_address\n"
}

REQ_PATH() {
    PROMPT_NUMBER
    requested_path=$(awk '{print $6 $7 $8}' $file | sort | uniq -c | sort -nr | head -n $n | awk '{printf "%-20s %s\n", $2, $1}')
    echo -e "\n${GREEN}Top $n requested paths:${RESET}\n$requested_path\n"
}

RES_CODE() {
    PROMPT_NUMBER
    response_code=$(awk '{print $9}' $file | sort | uniq -c | sort -nr | head -n $n | awk '{printf "%-20s %s\n", $2, $1}')
    echo -e "\n${GREEN}Top $n response codes:${RESET}\n$response_code\n"
}

USER_AGENT(){
    PROMPT_NUMBER
    user_agent=$(awk '{print $NF}' $file | sort | uniq -c | sort -nr | head -n $n | awk '{printf "%-20s %s\n", $2, $1}')
    echo -e "\n${GREEN}Top $n user agents:${RESET}\n$user_agent\n"
}

while true; do
    FEATURES
    echo -e "${YELLOW}Enter your choice: ${RESET}"
    read -r choice
    case "$choice" in
        1) IP_ADDR ;;
        2) REQ_PATH ;;
        3) RES_CODE ;;
        4) USER_AGENT ;;
        Q | q) break ;;
        C | c) clear ;;
        *) echo -e "${RED}Invalid option. Please select a valid option.${RESET}" ;;
    esac
done
