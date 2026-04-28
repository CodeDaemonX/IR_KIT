# IR_KIT Requirements

This document lists all third-party tools used by the IR_KIT scripts. These tools are **not** included in this repository and must be downloaded separately. Each tool is subject to its own license terms.

---

## Memory Acquisition

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| WinPmem | mini x64 RC2 | Windows | https://github.com/Velocidex/WinPmem/releases | Apache 2.0 |
| AVML | Latest | Linux | https://github.com/microsoft/avml/releases | MIT |

## Volatile Data / Artifact Collection

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| KAPE (Kroll Artifact Parser and Extractor) | Latest | Windows | https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape | Freeware (Registration Required) |
| CyLR | Latest | Windows, Linux, macOS | https://github.com/orlikoski/CyLR/releases | Apache 2.0 |
| Magnet RESPONSE | Latest | Windows | https://www.magnetforensics.com/resources/magnet-response/ | Freeware (Registration Required) |
| CyberTriage Collector | Latest | Windows | https://www.cybertriage.com/download/ | Commercial (Free Lite Version) |
| PostStander (TFO) | Latest | Windows | Contact TechFusion Ops / Your Agency | Law Enforcement Only |

## Filesystem Acquisition

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| FTK Imager (Portable) | 4.7 | Windows | https://www.exterro.com/digital-forensics-software/ftk-imager | Freeware (Registration Required) |
| FTK Imager (Command Line) | Latest | Windows | https://www.exterro.com/digital-forensics-software/ftk-imager | Freeware (Registration Required) |
| Fuji | Latest | macOS | https://github.com/Lazza/Fuji | See GitHub repository |

## Live Triage / Threat Scanning

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| THOR Lite | 10.7 | Windows, Linux, macOS | https://www.nextron-systems.com/thor-lite/ | Freeware (License Key Required) |
| osTriage | 25 | Windows | https://www.intaforensics.com/ostriage/ | Commercial |

## Encryption Detection

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| Encrypted Disk Detector (EDD) | 3.1.0 | Windows | https://www.magnetforensics.com/resources/encrypted-disk-detector/ | Freeware |

## Utility Tools

| Tool | Version | Platform | Download | License |
|------|---------|----------|----------|---------|
| Windows Terminal (Portable) | Latest | Windows | https://github.com/microsoft/terminal/releases | MIT |
| CamStudio Portable | Latest | Windows | https://camstudio.org/ | GPL v2 |
| Hasher | 1.9.0 | Windows | https://www.yourdownloads.org/hasher/ | Freeware |
| Mouse Jiggle | Latest | Windows | https://github.com/cerebrate/mousejiggle/releases | MS-PL |
| NotMyFault | Latest | Windows | https://learn.microsoft.com/en-us/sysinternals/downloads/notmyfault | Sysinternals EULA |
| Process Hacker | Latest | Windows | https://processhacker.sourceforge.io/ | GPL v3 |

---

## Installation Notes

1. Download each tool from the links above.
2. Place the tools in the corresponding directory under `TOOLS/`:
   - `TOOLS/Vol_Acquisition/winpmem/` - WinPmem
   - `TOOLS/Vol_Acquisition/avml/` - AVML
   - `TOOLS/Vol_Acquisition/KAPE/` - KAPE
   - `TOOLS/Vol_Acquisition/CyLR/` - CyLR
   - `TOOLS/Vol_Acquisition/Magnet/` - Magnet RESPONSE
   - `TOOLS/Vol_Acquisition/cybertriage/` - CyberTriage Collector
   - `TOOLS/Vol_Acquisition/PostStander-TFO/` - PostStander
   - `TOOLS/FS_Acquisition/FTK Imager_4.7_portable/` - FTK Imager GUI
   - `TOOLS/FS_Acquisition/FTK_Imager-commandline/` - FTK Imager CLI
   - `TOOLS/FS_Acquisition/Fuji/` - Fuji (macOS)
   - `TOOLS/Live_Triage/thor/thor-win/` - THOR Lite
   - `TOOLS/Live_Triage/thor/thor-mac/` - THOR Lite
   - `TOOLS/Live_Triage/thor/thor-linux/` - THOR Lite
   - `TOOLS/Live_Triage/osTriage25/` - osTriage
   - `TOOLS/Encryption/` - EDD
   - `TOOLS/Other_Tools/Terminal/` - Windows Terminal
   - `TOOLS/Other_Tools/Camstudio/` - CamStudio
   - `TOOLS/Other_Tools/Hasher/` - Hasher
   - `TOOLS/Other_Tools/NotMyFault/` - NotMyFault
   - `TOOLS/Other_Tools/ProcessHacker/` - Process Hacker

3. Some tools require registration or license keys before download. Plan accordingly.
