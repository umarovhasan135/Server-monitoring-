# Linux Server Monitoring with Telegram Alerts

A lightweight Bash-based monitoring tool for Linux servers.

## Features

- Monitors CPU load, RAM usage, and disk usage.
- Sends Telegram alerts when configured thresholds are exceeded.
- Sends notifications when the system returns to normal.
- Allows configuration through `monitoring.conf`.
- Supports running as a systemd service.

## Technologies

- Linux (Ubuntu)
- Bash scripting
- Telegram Bot API
- systemd
- Git and GitHub

## Configuration

1. Copy the example configuration:

   ```bash
   cp monitoring.conf.example monitoring.conf
   ```

2. Edit `monitoring.conf` and enter your Telegram bot token and chat ID.
3. Adjust monitoring intervals and thresholds as needed.

**Security:** Never upload `monitoring.conf` or your Telegram bot token to GitHub.

## Run

```bash
chmod +x start.sh
./start.sh
```

## What I Learned

- Linux server resource monitoring
- Bash scripting and configuration management
- Telegram notifications and alert handling
- Git version control and project documentation
