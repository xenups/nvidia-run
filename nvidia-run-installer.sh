#!/bin/bash

# Check if script is run with sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run with sudo privileges" 
   exit 1
fi

# Create and open the nvidia-run file
cat << EOF > /usr/local/bin/nvidia-run
#!/usr/bin/bash
env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only VK_DRIVER_FILES=/usr/share/vulkan/icd.d/nvidia_icd.json LIBVA_DRIVER_NAME=nvidia "\$@"
EOF

# Make the nvidia-run script executable
chmod +x /usr/local/bin/nvidia-run

# Add autocomplete for nvidia-run applications

# Define the completion command to be added
completion_command='complete -c nvidia-run'

# Check if the completion command already exists in the .bashrc file
if ! sudo -u $SUDO_USER bash -c 'cat $HOME/.bashrc' | grep -qF "$completion_command"; then
    # If it doesn't exist, add it to .bashrc
    sudo -u $SUDO_USER bash -c 'echo "$1" >> $HOME/.bashrc' -- "$completion_command"
    echo "Completion command added to ~/.bashrc"
else
    # If it already exists, notify the user
    echo "Completion command already exists in ~/.bashrc"
fi

sudo -u $SUDO_USER bash -c 'source $HOME/.bashrc'
