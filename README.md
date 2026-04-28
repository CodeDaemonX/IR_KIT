# IR_KIT - Incident Response Toolkit

**Author:** Jeremy Brice - Cyberbyte Consulting  
**Contact:** forensics@cyberbyteconsulting.com  
**Website:** https://cyberbyteconsulting.com  
**Last Updated:** 2026-04-28  
**License:** MIT (scripts only - see LICENSE)

---

## Overview

IR_KIT is a portable incident response toolkit designed for rapid deployment during cybersecurity incidents. It provides automated collection scripts for Windows, Linux, and macOS systems, orchestrating multiple forensic tools to acquire memory, volatile data, filesystem images, and live triage results.

## Supported Platforms

- **Windows** (`win_IR.bat`) - Full-featured collection including memory, volatile data, artifact triage, filesystem imaging, and encryption detection
- **Linux** (`lin_IR.sh`) - Memory acquisition, system information, artifact collection, and live triage
- **macOS** (`mac_IR.sh`) - Memory acquisition, system information, artifact collection, and live triage

## Directory Structure

```
IR_KIT/
├── win_IR.bat                  # Windows IR collection script
├── lin_IR.sh                   # Linux IR collection script
├── mac_IR.sh                   # macOS IR collection script
├── poststander.bat             # PostStander launcher
├── terminal.bat                # Portable Windows Terminal launcher
├── LICENSE                     # MIT License (scripts only)
├── REQUIREMENTS.md             # Third-party tool list with download links
├── README.md                   # This file
└── TOOLS/
    ├── Encryption/             # Encrypted Disk Detector (EDD)
    ├── FS_Acquisition/         # FTK Imager (GUI + CLI), Fuji
    ├── Live_Triage/            # THOR Lite, osTriage
    ├── Other_Tools/            # CamStudio, Hasher, MouseJiggle,
    │                             NotMyFault, ProcessHacker, Terminal
    └── Vol_Acquisition/        # AVML, CyberTriage, CyLR, KAPE,
                                  Magnet RESPONSE, PostStander, WinPmem
```

## Windows Collection Workflow (win_IR.bat)

The Windows script provides an interactive, menu-driven collection process:

1. **Memory Acquisition** - Full physical memory dump via WinPmem
2. **Volatile Data Collection** - System info, network state, processes, services, scheduled tasks, user accounts, registry autoruns, VSS, disk info, BitLocker status, and encryption detection (EDD)
3. **CyberTriage** - Automated host-based triage collection
4. **KAPE** - Targeted artifact collection (KapeTriage + MemoryFiles)
5. **Magnet RESPONSE** - Volatile data, system files, and ransomware note capture
6. **CyLR** - Forensic artifact collection with minimal disk impact
7. **THOR Lite** - Live IOC and YARA-based threat scanning
8. **FTK Imager CLI** - Logical or physical disk imaging (E01 format)

Each step is optional and can be skipped or the script can be exited at any point.

## Linux Collection Workflow (lin_IR.sh)

1. System information collection
2. Memory acquisition via AVML
3. Artifact collection via CyLR
4. Live triage via THOR Lite

## macOS Collection Workflow (mac_IR.sh)

1. System information collection
2. Filesystem acquisition via Fuji (GUI — launched manually)
3. Artifact collection via CyLR
4. Live triage via THOR Lite

## Usage

### Windows
```cmd
:: Run as Administrator from the IR_KIT directory
win_IR.bat
```

### Linux
```bash
# Run as root from the IR_KIT directory
chmod +x lin_IR.sh
sudo ./lin_IR.sh
```

### macOS
```bash
# Run as root from the IR_KIT directory
chmod +x mac_IR.sh
sudo ./mac_IR.sh
```

## Output

All collected data is saved to `<drive>:\<HOSTNAME>\` (Windows) or `<script_dir>/<hostname>/` (Linux/macOS), with a timestamped `log.txt` tracking each collection phase.

## Prerequisites

All third-party tools must be downloaded separately and placed in the appropriate `TOOLS/` subdirectories. See **REQUIREMENTS.md** for the complete list with download links and licensing information.

## Important Notes

- Always run with elevated privileges (Administrator / root)
- Deploy from a dedicated USB drive when possible
- The scripts in this repository are licensed under MIT; the third-party tools in `TOOLS/` are subject to their own respective licenses
- Verify tool versions and update regularly
- Test in your environment before deploying to live incidents
