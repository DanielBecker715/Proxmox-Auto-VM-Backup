# Proxmox Auto VM Backup
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

The Proxmox Auto VM Backup system creates a screen session and backs up all virtual machines. Note that template virtual machines with IDs above 10900 are not included in the backup because they do not need to be backed up separately.

## Requirements

To use this backup system, you need to have the following requirements installed:

+ Operating System: Linux
+ Required packages: proxmox, screen, git

## Installation
To install the Proxmox Auto VM Backup system, follow these steps:

1. Create the backup directory:
`mkdir /backup`
2. Navigate the backup directory:
`cd /backup`
2.  Clone the repository:
`git clone https://github.com/DanielBecker715/Proxmox-Auto-VM-Backup.git`

## Usage
Once the installation is complete, you can start using the system. Run the following command to begin backing up your virtual machines:
`bash /backup/runBackup.sh`

## License
This project is licensed under the MIT License - see the LICENSE file for details.