# 🧹 Downloads Cronjob

A simple and robust Bash script designed to keep your Downloads folder tidy by automatically deleting old files and directories that have not been modified within a defined period (by default, 14 days).

## 🚀 Features

* **Automatic Cleanup:** Removes unmodified items (files and directories) that exceed the time limit.
* **Portability:** Works flawlessly on Unix-based operating systems (Linux, macOS).
* **Easy to Schedule:** Designed to be executed daily using a `cronjob` or `crontab`.

## 🛠️ Requirements

* A Unix-based operating system (Linux or macOS).
* The **Bash** interpreter installed (standard on both systems).

## ⚙️ Usage and Installation

### 1. Download the Script

Save the script in a secure directory and ensure it has execution permissions. A dedicated script directory is recommended:

```bash
# Create the scripts directory (if it doesn't exist)
mkdir -p ~/scripts

cd ~/scripts
# Download the file (assuming you named it 'clean-downloads.sh')
# Copy the code here or download from GitHub.

# Grant execution permissions
chmod +x ~/scripts/clean-downloads.sh
````

### 2. Configure Variables (Optional)

You can modify these variables inside the script (`clean-downloads.sh`) if your downloads folder has a different name or if you want to change the time period:

```bash
# If your folder is named 'Downloads' (common on macOS/English systems)
# DOWNLOADS_DIR="$HOME/Downloads"

# Days old criteria. +14 means "more than 14 days unmodified."
DAYS_OLD="+14" 
```

### 3. Automation with Cronjob (Recommended)

To have the script run automatically every day, schedule a task using `crontab`.

1.  Open your scheduled task table editor:

    ```bash
    crontab -e
    ```

2.  Add the following line. This example schedules the script to run **every day at 3:00 AM**.

    ```cron
    # Minutes(0-59) Hour(0-23) DayMonth(1-31) Month(1-12) DayWeek(0-7) | Command
    0 11 * * * /bin/bash $HOME/scripts/clean-downloads.sh
    ```

    > **Note:** If your computer is usually off at that time, consider using a time when it's generally on (e.g., `0 8 * * *` for 8:00 AM), or schedule multiple executions (`0 8,18 * * *`).

3.  Save and exit the editor.

## 🚨 Safety Note

The script uses the command `find ... -delete`.

  * **`find`**: Searches for items (files and directories).
  * **`-mtime +14`**: Filters items whose **last modification time** was over 14 days ago.
  * **`-delete`**: Permanently removes the found items. **This action cannot be undone\!**

It is highly recommended to **run the test version** before automation to see which files will be deleted:

```bash
find "$HOME/Descargas" -depth -mtime +14
```

## 📜 Script Code (`clean-downloads.sh`)

```bash
#!/bin/bash

# --- Configuration ---
DOWNLOADS_DIR="$HOME/Descargas"
DAYS_OLD="+14"

echo "🗑️ Deleting files and directories unmodified for over $DAYS_OLD days from $DOWNLOADS_DIR..."
echo "--------------------------------------------------------------------------------"

# -depth: Ensures content is processed before the directory itself.
# -mtime $DAYS_OLD: Finds files and directories modified more than N days ago.
find "$DOWNLOADS_DIR" -depth -mtime $DAYS_OLD -delete

echo "✅ Cleanup completed."
```

## 🏷️ License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.