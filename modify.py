### Junhyeok - 24.12.02 ###

import sys

def modify_line_in_file(file_path, line_number, new_text):
    try:
        with open(file_path, 'r') as file:
            lines = file.readlines()

        if line_number < 1 or line_number > len(lines):
            raise IndexError("The specified line number is out of range.")

        lines[line_number - 1] = new_text + '\n'

        with open(file_path, 'w') as file:
            file.writelines(lines)

        print(f"Line {line_number} in file '{file_path}' has been successfully updated.")

    except FileNotFoundError:
        print(f"File '{file_path}' not found.")
    except IndexError as e:
        print(e)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

if __name__ == "__main__":
    if len(sys.argv) != 4:
        print("Usage: python3 modify.py <file_path> <line_number> <update-text>")
        sys.exit(1)

    try:
        target_file = sys.argv[1]  ## Path to the file
        line_to_modify = int(sys.argv[2])  ## Line number (1-based index)
        replacement_text = sys.argv[3]  ## New text for the specified line

        modify_line_in_file(target_file, line_to_modify, replacement_text)

    except ValueError:
        print("Error: <line_number> must be an integer.")
        sys.exit(1)
