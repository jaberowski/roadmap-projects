#!/bin/bash 


logdir=${1:-/var/log}
outdir=${2:-/var/log/archives}
timestamp=$(date +"%Y%m%d_%H%M%S")
archive_name="log_archives_$timestamp.tar.gz"

mkdir -p "$outdir"

tar -czvf  "${outdir}/${archive_name}" "${logdir}"

echo "$(date +"%Y-%m-%d %H:%M:%S") -> $archive_name" >> "$outdir/archive_log.txt"
echo  "Archive created:  $outdir/$archive_name"