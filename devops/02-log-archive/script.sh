#!/bin/bash 

set -euo pipefail

if [[ $# -gt 2 ]] ;then
    echo "ERROR: Usage: $0 [logdir] [outdir]" >&2
    exit 1
fi

logdir=${1:-/var/log}
outdir=${2:-/var/log/archives}
timestamp=$(date +"%Y%m%d_%H%M%S")
archive_name="log_archives_$timestamp.tar.gz"


if [[ ! -d "$logdir" ]] ;then 
    echo "ERROR: $logdir directory does not exist" >&2 
    exit 1
fi 


mkdir -p -- "$outdir" || { echo "ERROR: Cannot create output directory ($outdir)" >&2 ; exit 1 ; }


if tar -czf -- "${outdir}/${archive_name}" "${logdir}";  then
    echo "$(date +"%Y-%m-%d %H:%M:%S") -> $archive_name" >> "$outdir/archive_log.txt"
    echo  "Archive created:  $outdir/$archive_name"
else 
    echo "ERROR: error compressing logs" >&2
    exit 1
fi


