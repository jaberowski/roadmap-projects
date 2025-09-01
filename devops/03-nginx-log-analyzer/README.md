# Nginx Log Analyzer

## Prerequisites

- Linux-based operating system
- Bash shell

## How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/jaberowski/roadmap-projects/
   ```

2. Navigate to the project directory:

   ```bash
   cd roadmap-projects/devops/03-nginx-log-analyzer
   ```

3. Make the script executable:

   ```bash
   chmod +x script.sh
   ```

4. Run the script with the log file as an argument:

   ```bash
   ./script.sh [log_file]
   ```

   - If no log file is provided, the script will default to `./nginx-access.log`.

## Output

The script provides the following information:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

### Example Output

```
Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
178.128.94.113 - 50 requests
43.224.43.187 - 30 requests
178.128.94.113 - 20 requests

Top 5 most requested paths:
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
/api/v1/orders - 50 requests
/api/v1/payments - 30 requests
/api/v1/reviews - 20 requests

Top 5 response status codes:
200 - 1000 requests
404 - 600 requests
500 - 50 requests
401 - 30 requests
304 - 20 requests
```

## Notes

- Ensure you have the necessary permissions to execute the script.
- The script is designed for educational purposes and may require modifications for production use.

## Project Reference

For more details, visit the [Nginx Log Analyzer Project Page](https://roadmap.sh/projects/nginx-log-analyser).
