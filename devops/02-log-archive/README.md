# Log Archive Tool

This project contains a script to archive logs efficiently. Follow the instructions below to run the script.

## Instructions to Run

1. Navigate to the `02-log-archive` directory:
   ```bash
   cd /home/jaber/code/projects/roadmap-projects/devops/02-log-archive
   ```

2. Run the script with the following command:
   ```bash
   ./script.sh [source_directory] [destination_directory]
   ```
   Both arguments are optional. If not provided, the script will use the following default behavior:
   - `source_directory`: Defaults to `/var/log`
   - `destination_directory`: Defaults to `/var/log/archives`

   Example:
   ```bash
   ./script.sh
   ```

   Example with provided arguments:
   ```bash
   ./script.sh /home/user/logs /home/user/archives
   ```
   This will archive logs from `/home/user/logs` into `/home/user/archives`.

## Project Reference

For more details about this project, visit the [Log Archive Tool Project Page](https://roadmap.sh/projects/log-archive-tool).
