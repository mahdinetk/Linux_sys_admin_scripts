# Linux System Admin Scripts

This repository contains a set of simple yet powerful shell scripts designed to assist with common Linux system administration tasks.

## Scripts Included:

1. **Backup Script (backup.sh)**  
   This script automates the process of backing up a specified directory to a destination. The script compresses files in a directory into a `.tar.gz` file with a timestamp in the name.

you should set the path of directory where you want to backup and the destination directory Where you want to put the backup by changing `BACKUP_DIR` and `DEST_DIR` variables


2. **Log Monitoring Script (log-monitor.sh)**  
   This script checks a log file for any occurrences of the keyword "ERROR" and sends an alert if it finds any.
you should set the path of log file and the email address (or username) of admin by changing `LOG_FILE` and `MAIL` variables


3. **Folder Permission Script (folder-permission.sh)**  
   This script checks if the current user has write and read access to a specified directory. If not, it attempts to grant the required permissions.
after executing this script it asks you the path of target directory each timel

## How to Use:
1. Clone the repository:
   
```bash
   git clone https://github.com/mahdinetk/Linux_sys_admin_scripts.git
  
2. Make the scripts executable:
   
```bash
   chmod +x backup.sh log-monitor.sh folder-permission.sh
  

3. Run the scripts with the appropriate arguments.
