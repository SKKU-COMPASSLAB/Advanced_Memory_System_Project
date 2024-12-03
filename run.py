### Junhyeok - 24.12.02 ###

import sys
import os
import subprocess

# Configuration: Define benchmark list file and output directory here
CONFIG_FILE = "./benchmark.txt"  # Path to the file containing the list of benchmarks

# Command template with placeholders for the benchmark and additional config file
COMMAND_TEMPLATE = "./ramulator configs/DDR4-config.cfg --mode=cpu --stats {result} ./cputraces/{benchmark} 1> /dev/null &"

def read_benchmarks(config_file):
    try:
        with open(config_file, 'r') as file:
            benchmarks = [line.strip() for line in file if line.strip()]  # Ignore empty lines
        return benchmarks
    except FileNotFoundError:
        print("Error: Config file '{config_file}' not found.")
        return []
    except Exception as e:
        print("An error occurred while reading the config file: {e}")
        return []

def run_command(benchmark, exe_option):
    os.makedirs("./result/" + exe_option, exist_ok=True)

    result_path = "./result/" + exe_option + "/output_" + benchmark + "_" + exe_option + ".txt"
    command = COMMAND_TEMPLATE.replace("{benchmark}", benchmark).replace("{result}", result_path)

    try:
        # Run the command and redirect output to the log file
        print('Running command for | ' + benchmark + ' | ' + command + '\n')
        subprocess.run(["bash", "-c", command])

    except Exception as e:
        print("An unexpected error occurred while running benchmark '{benchmark}': {e}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python3 run.py <exe_option>")
        sys.exit(1)

    try:
        exe_option = sys.argv[1]

        benchmarks = read_benchmarks(CONFIG_FILE)
        if not benchmarks:
            print("No benchmarks to process. Exiting.")
            sys.exit(1)

        for benchmark in benchmarks:
            run_command(benchmark, exe_option)

    except ValueError:
        print("Error!!")
        sys.exit(1)

