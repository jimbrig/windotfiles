# ~/.dotfiles

> My Windows specific `.dotfiles`.

See the [CHANGELOG](CHANGELOG.md) for details on progress.

## Contents

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->


- [About](#about)
- [Specifications](#specifications)
- [Considerations](#considerations)
- [Installation](#installation)
- [Backing Up](#backing-up)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
*Generated with [DocToc](https://github.com/thlorenz/doctoc)*

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## About

- The dotfiles are intended for use on a Windows machine running either Windows 10 Pro or Windows 11 Pro.
- The dotfiles also include WSL specific configurations and setups.
- Dotfiles are managed using [GNU Stow](https://github.com/jimbrig/dotfiles-wsl/blob/main) and various tweaks I have created to keep home directory as lean as possible.

## Specifications

- View my full System Information export here: [docs/MSI-Machine-System-Information.txt](docs/MSI-Machine-System-Information.txt).

- Output from `systeminfo` command:

<details><summary>View Output:</summary><p>

```powershell
# ~\.dotfiles :: git(develop)                               21:09:20
➜ systeminfo

Host Name:                 DESKTOP-MSI
OS Name:                   Microsoft Windows 11 Pro Insider Preview
OS Version:                10.0.22499 N/A Build 22499
OS Manufacturer:           Microsoft Corporation
OS Configuration:          Standalone Workstation
OS Build Type:             Multiprocessor Free
Registered Owner:          jimmy.briggs@jimbrig.com
Registered Organization:
Product ID:                00330-80000-00000-AA337
Original Install Date:     11/12/2021, 12:13:50 AM
System Boot Time:          11/14/2021, 7:55:51 PM
System Manufacturer:       Micro-Star International Co., Ltd.
System Model:              GE66 Raider 10SFS
System Type:               x64-based PC
Processor(s):              1 Processor(s) Installed.
                           [01]: Intel64 Family 6 Model 165 Stepping 2 GenuineIntel ~2592 Mhz
BIOS Version:              American Megatrends Inc. E1541IMS.10F, 3/10/2021
Windows Directory:         C:\WINDOWS
System Directory:          C:\WINDOWS\system32
Boot Device:               \Device\HarddiskVolume1
System Locale:             en-us;English (United States)
Input Locale:              en-us;English (United States)
Time Zone:                 (UTC-05:00) Eastern Time (US & Canada)
Total Physical Memory:     32,577 MB
Available Physical Memory: 13,657 MB
Virtual Memory: Max Size:  37,441 MB
Virtual Memory: Available: 7,948 MB
Virtual Memory: In Use:    29,493 MB
Page File Location(s):     C:\pagefile.sys
Domain:                    WORKGROUP
Logon Server:              \\DESKTOP-MSI
Hotfix(s):                 3 Hotfix(s) Installed.
                           [01]: KB5007296
                           [02]: KB5008400
                           [03]: KB5008404
Network Card(s):           4 NIC(s) Installed.
                           [01]: Realtek USB GbE Family Controller
                                 Connection Name: Ethernet 2
                                 Status:          Media disconnected
                           [02]: Killer E3100X 2.5 Gigabit Ethernet Controller
                                 Connection Name: Ethernet
                                 DHCP Enabled:    Yes
                                 DHCP Server:     192.168.1.1
                                 IP address(es)
                                 [01]: 192.168.1.19
                                 [02]: fe80::a91a:7b5:5473:81de
                                 [03]: 2601:c0:c67f:d0b9:a9ce:7eac:21c3:3782
                                 [04]: 2601:c0:c67f:d0b9:a91a:7b5:5473:81de
                           [03]: Killer(R) Wi-Fi 6 AX1650i 160MHz Wireless Network Adapter (201NGW)
                                 Connection Name: Wi-Fi
                                 DHCP Enabled:    Yes
                                 DHCP Server:     192.168.1.1
                                 IP address(es)
                                 [01]: 192.168.1.14
                                 [02]: fe80::39d3:ac3a:57d3:ef11
                                 [03]: 2601:c0:c67f:d0b9:bd46:cf74:cad7:2539
                                 [04]: 2601:c0:c67f:d0b9:39d3:ac3a:57d3:ef11
                           [04]: Bluetooth Device (Personal Area Network)
                                 Connection Name: Bluetooth Network Connection
                                 Status:          Media disconnected
Hyper-V Requirements: 
A hypervisor has been detected. 
Features required for Hyper-V will not be displayed.
```
</p></details>


## Considerations

## Installation

## Backing Up

