#!/bin/bash

# Mac Incident Response Script
# By Jeremy Brice
# Forensics@JeremyBrice.com
# Updated: 2026-01-07

# Configuration Variables
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
FUJI_PATH="$SCRIPT_DIR/TOOLS/Vol_Acquisition/Fuji/Fuji"
CYLR_PATH="$SCRIPT_DIR/TOOLS/Vol_Acquisition/CyLR/CyLR_mac"
THOR_PATH="$SCRIPT_DIR/TOOLS/Live_Triage/thor/thor10.7lite-linux/thor-lite-macosx"
OUTPUT_DIR="$SCRIPT_DIR/$(hostname)"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")


# Ensure script is run with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# System Info
log_system_info() {
    local log_file="$OUTPUT_DIR/system_info.txt"

echo "$timestamp: Started System Information acquisition"
	echo "$timestamp: Started System Information acquisition" >> "$OUTPUT_DIR/log.txt"	

    {
        echo "Hostname: $(hostname)"
        echo "Kernel: $(uname -r)"
        echo "Architecture: $(uname -m)"
        echo "Total Memory: $(free -h | grep Mem: | awk '{print $2}')"
        echo "Memory Usage Before Capture:"
        free -h
        echo "Disk Space:"
        df -h
		echo "Minidump info: $(ifconfig, uname –a, system_profiler –detailLevel mini)"
    } > "$log_file"

   echo "$timestamp: Completed System Information acquisition"
	echo "$timestamp: Completed System Information acquisition" >> "$OUTPUT_DIR/log.txt"
}
# Fuji
acquire_fuji() {
	mkdir -p "$OUTPUT_DIR/fuji"
    local fuji_output_file="$OUTPUT_DIR/fuji/fuji_output.zip"
	local fuji_output_log="$OUTPUT_DIR/fuji/fuji.log"
    echo "$timestamp: Started Fuji acquisition"
	echo "$timestamp: Started Fuji acquisition" >> "$OUTPUT_DIR/log.txt"
    echo "Output file: $fuji_output_file"

    if ! "$FUJI_PATH" -od "$fuji_output_file" -l "$fuji_output_log"; then
        echo "Error: Fuji collection failed"
        return 1
    fi

    echo "$timestamp: Completed Fuji acquisition"
	echo "$timestamp: Completed Fuji acquisition" >> "$OUTPUT_DIR/log.txt"
# CyLR
acquire_cylr() {
	mkdir -p "$OUTPUT_DIR/cylr"
    local cylr_output_file="$OUTPUT_DIR/cylr/cylr_output.zip"
	local cylr_output_log="$OUTPUT_DIR/cylr/cylr.log"
    echo "$timestamp: Started CyLR acquisition"
	echo "$timestamp: Started CyLR acquisition" >> "$OUTPUT_DIR/log.txt"
    echo "Output file: $cylr_output_file"

    if ! "$CYLR_PATH" -od "$cylr_output_file" -l "$cylr_output_log"; then
        echo "Error: CyLR live response collection failed"
        return 1
    fi

    echo "$timestamp: Completed CyLR Live Response acquisition"
	echo "$timestamp: Completed CyLR Live Response acquisition" >> "$OUTPUT_DIR/log.txt"
	
# Thor
triage_thor() {
	mkdir -p "$OUTPUT_DIR/thor"	
    local thor_output_file="$OUTPUT_DIR/thor/thor_output.zip"

    echo "$timestamp: Started Thor Live Triage"
	echo "$timestamp: Started Thor Live Triage" >> "$OUTPUT_DIR/log.txt"
    echo "Output file: $thor_output_file"

    if ! "$THOR_PATH" --quick -e "$thor_output_file"; then
        echo "Error: Thor triage failed"
        return 1
    fi

     echo "$timestamp: Completed Thor Live Triage"
	echo "$timestamp: Completed Thor Live Triage" >> "$OUTPUT_DIR/log.txt"
}

# Main execution
main() {

    # Log system information
    log_system_info
	
	# Validate Fuji path
    if [[ ! -x "$FUJI_PATH" ]]; then
        echo "Error: Fuji not found at $FUJI_PATH"
        echo "Please check the Fuji path and ensure it's executable"
        return 1
    fi
	# Perform fuji acquisition
	acquire_fuji
	
	# Validate CyLR path
    if [[ ! -x "$CYLR_PATH" ]]; then
        echo "Error: CyLR not found at $CYLR_PATH"
        echo "Please check the CyLR path and ensure it's executable"
        return 1
    fi
	# Perform cylr acquisition
	acquire_cylr
	
	# Validate thor path
    if [[ ! -x "$THOR_PATH" ]]; then
        echo "Error: Thor not found at $THOR_PATH"
        echo "Please check the Thor path and ensure it's executable"
        return 1
    fi

	# Perform thor acquisition
	triage_thor

echo "$timestamp: Completed Acquisition, review above output for errors"
echo "$timestamp: Completed Acquisition" >> "$OUTPUT_DIR/log.txt"
}

# Trap to handle interruptions
trap 'echo "Acquisition interrupted"; exit 1' SIGINT SIGTERM

# Run the main function
main
