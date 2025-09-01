#!/bin/bash


LOG_FILE=${1:-./nginx-access.log}

check_log_file() {
    local file="$1"
    [[ ! -f "$file" ]] && { echo "ERROR: $file does not exist." >&2; exit 1; }
    [[ ! -r "$file" ]] && { echo "ERROR: $file is not readable." >&2; exit 1; }
}

find_top_status_codes(){
    echo -e "Count\tStatus"
    awk '{print $9}' "$LOG_FILE" | sort -n | uniq -c | sort -nr | head -5 
}

find_top_ip_addresses(){
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr -k1,1 | head -5
}

find_top_requested_path(){
    awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr -k1,1 | head -5
}

main(){
    check_log_file "$LOG_FILE"
    echo -e "\n=== Top 5 IP Addresses Accessing the Server ==="
    find_top_ip_addresses
    echo -e "\n=== Top 5 HTTP Status Codes Returned ==="
    find_top_status_codes
    echo -e "\n=== Top 5 Requested Paths ==="
    find_top_requested_path
}

main "$@"
