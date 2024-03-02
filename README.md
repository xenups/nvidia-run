```
# NVIDIA-Run Installer


## Overview
This script facilitates running applications with the NVIDIA graphics card as the secondary GPU. It configures the environment for the applications to utilize the discrete graphics card using "nvidia-run".

## Installation
To install the NVIDIA-Run script, follow these steps:

1. Download the `nvidia-run-installer.sh` script.
2. Make the script executable:
   ```bash
   chmod +x nvidia-run-installer.sh
   ```
3. Run the script with sudo privileges:
   ```bash
   sudo ./nvidia-run-installer.sh
   ```

The installer script will perform the following actions:
- Check if it is run with sudo privileges.
- Create a script named "nvidia-run" with specific environment variables set to utilize the NVIDIA graphics card.
- Make the "nvidia-run" script executable.
- Add autocomplete functionality for "nvidia-run" to the user's .bashrc file if it's not already present.
- Source the .bashrc file to apply changes.

## Usage
After installation, you can run applications with the NVIDIA graphics card as the secondary GPU using the "nvidia-run" command followed by the application name. For example:
```
nvidia-run vlc
```

## Requirements
- Bash shell
- NVIDIA graphics card and drivers installed
- Access to run scripts with sudo privileges
```
# nvidia-run
