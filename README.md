# Nginx Access Log Analysis Script

## Overview
This Bash script analyzes Nginx access logs and extracts useful insights such as:
- Top IP addresses with the most requests
- Most requested paths
- Most common response status codes
- Most frequently used user agents

## Usage
Run the script using the following command:
```bash
./script.sh
```
Ensure that the script has execute permissions:
```bash
chmod +x script.sh
```

## Features
1. Displays the top `n` IP addresses that have made the most requests.
2. Shows the top `n` most requested paths.
3. Lists the top `n` response status codes.
4. Identifies the top `n` user agents.

## Configuration
- The script defaults to using the Nginx access log located at:
  ```
  /var/log/nginx/access.log
  ```
- You can modify this path inside the script if needed.

## Dependencies
- Bash shell
- Nginx server with access logs enabled
- `awk`, `grep`, and `sort` (typically available in most Linux distributions)

## Example Output
```
Top 5 IP Addresses:
192.168.1.1 - 120 requests
203.0.113.5 - 98 requests
...
```

## Notes
- Ensure that you have read permissions for the log file.
- Large log files may take longer to process.
