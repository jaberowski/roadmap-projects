#!/bin/bash 


logdir=${1:-/var/log}
outdir=${2:-/var/log/archives}
timestamp=$(date +"%Y%m%d_%H%M%S")
archive_name="log_archives_$timestamp.tar.gz"

if [[ $# -gt 2 ]] ;then
    echo "ERROR: $0 can only takes 0 to 2 arguments" 
    exit 1
fi


if [[ ! -d "$logdir" ]] ;then 
    echo "ERROR: $logdir directory does not exist"
    exit 1
fi 


mkdir -p "$outdir"

tar -czvf  "${outdir}/${archive_name}" "${logdir}"

if [[ $? -eq 0 ]];  then
    echo "$(date +"%Y-%m-%d %H:%M:%S") -> $archive_name" >> "$outdir/archive_log.txt"
    echo  "Archive created:  $outdir/$archive_name"
else 
    echo "ERROR: error compressing logs"
    exit 1
fi


