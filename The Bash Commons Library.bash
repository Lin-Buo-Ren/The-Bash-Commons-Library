#!/usr/bin/env bash
# This is a GNU Bash library to attempt to make lives easier.
# https://github.com/Lin-Buo-Ren/The-Bash-Commons-Library
# 林博仁 © 2016
# This file is released using WTFPL license
# Consider undefined variable as an error
set -u

# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.  The shell does not exit if the command that fails is part of the command list immediately following a `while' or `until' keyword, part of the test in an `if' statement, part of any command executed in a `&&' or `||' list except the command following the final `&&' or `||', any command in a pipeline but the last, or if the command's return status is being inverted with `!'.  If a compound command other than a subshell returns a non-zero status because a command failed while `-e' was being ignored, the shell does not exit.  A trap on `ERR', if set, is executed before the shell exits.
set -e

# If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -o pipefail

# Support alias in script
shopt -s expand_aliases

## Meaninful Bash Conditional Expressions ##
bash_commons_test_if_file_exist(){
	local file_path="${1}"

	test -a "$file_path"
# 	Causes a function or sourced script to exit with the return value
#   specified by N.  If N is omitted, the return status is that of the
#   last command executed within the function or script.
	return
}
alias bash_test_if_file_exist=bash_commons_test_if_file_exist
alias bc_test_if_file_exist=bash_commons_test_if_file_exist
alias bc_is_file_exist=bash_commons_test_if_file_exist

## Meta definitions and functions, just for Bash Commons itself ##
BASH_COMMONS_EXECUTABLE_FILENAME="$(basename "${0}")"
readonly BASH_COMMONS_EXECUTABLE_FILENAME

BASH_COMMONS_EXECUTABLE_DIRECTORY="$(realpath --relative-to="$(pwd)" --no-symlinks "$(dirname "${0}")")"
readonly BASH_COMMONS_EXECUTABLE_DIRECTORY

declare -r BASH_COMMONS_EXECUTABLE_PATH="${BASH_COMMONS_EXECUTABLE_DIRECTORY}/${BASH_COMMONS_EXECUTABLE_FILENAME}"

declare -ri BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL="${#}"

declare -a BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL
if [ "$BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL" -eq 0 ]; then
	BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL=(nothing)
else
	BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL=("$@")
fi
readonly BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL

bash_commons_meta_print_help(){
	local -r bash_commons_file_path="${1}"

	printf "# The Bash Commons Library #\n"
	printf "Source this file to use the library, or run\n"
	printf "\n"
	printf "\t%s --demonstration\n" "${bash_commons_file_path}"
	printf "\n"
	printf "for demonstration.\n"
	return
}

bash_commons_meta_demonstration(){
	local -r path_test_cases="Test Cases"
	local path_test_case_title_holder=""

	printf "# The Bash Commons Library Demonstration #\n"

	mkdir --parents "${path_test_cases}"

	local -r testcase_path_regular_file="${path_test_cases}/Regular File"
	touch "${testcase_path_regular_file}"

	path_test_case_title_holder="bash_commons_test_if_file_exist"
	local test_result_holder=1 # zero: passed; one: failed
	printf "## %s() ##\n" "${path_test_case_title_holder}"
	if bash_commons_test_if_file_exist "${testcase_path_regular_file}"; then
		if ! bash_commons_test_if_file_exist "${testcase_path_regular_file}x"; then
			test_result_holder=0
		else
			test_result_holder=1
		fi
	else
		test_result_holder=1
	fi
	if [ $test_result_holder ]; then
		printf "%s: passed\n" "${path_test_case_title_holder}"
	else
		printf "%s: failed\n" "${path_test_case_title_holder}"
	fi
	unset test_result_holder # Let program fail when reference is not valid

	printf "\n"

	path_test_case_title_holder="Test alias functions"
	local test_result_holder=1 # zero: passed; one: failed
	printf "## %s ##\n" "${path_test_case_title_holder}"
	if bash_test_if_file_exist "${testcase_path_regular_file}"; then
		if bc_test_if_file_exist "${testcase_path_regular_file}"; then
			if bc_is_file_exist "${testcase_path_regular_file}"; then
				if ! bc_is_file_exist "${testcase_path_regular_file}x"; then
					test_result_holder=0
				else
					test_result_holder=1
				fi
			else
				test_result_holder=1
			fi
		else
			test_result_holder=1
		fi
	else
		test_result_holder=1
	fi
	if [ $test_result_holder ]; then
		printf "%s: passed\n" "${path_test_case_title_holder}"
	else
		printf "%s: failed\n" "${path_test_case_title_holder}"
	fi
	unset test_result_holder

	# Cleanup
	rm -rf "${path_test_cases}"
	return
}

bash_commons_meta_main(){
	local -r bash_commons_file_name="${1}"; shift
	shift # local -r bash_commons_file_directory="${1}"; shift
	local -r bash_commons_file_path="${1}"; shift
	local -ir bash_commons_commandline_argument_quantity="${1}"; shift
	local -a bash_commons_commandline_argument_list="${1}"
	# `local -ar` somehow doesn't work("bash_commons_commandline_argument_list: readonly variable")
	readonly bash_commons_commandline_argument_list

	# If source'd but not run, don't do anything
	if ! echo "${bash_commons_file_name}" | grep --quiet "The Bash Commons Library" ; then
		return
	fi

	# If no command-line arguments, print help info and exit
	if [ "${bash_commons_commandline_argument_quantity}" -eq 0 ]; then
		bash_commons_meta_print_help "${bash_commons_file_path}"
		exit 0
	fi

	# Parse command line arguments
	# FIXME: Implement this after array access is implemented, for now we simply assume that 1 argument means demonstration
	if [ "${bash_commons_commandline_argument_quantity}" -eq 1 ]; then
		printf "Warning: assuming --demonstration, run this program without command-line arguments to see usage.\n" 1>&2
		bash_commons_meta_demonstration
		exit 0
	fi
}

bash_commons_meta_main "${BASH_COMMONS_EXECUTABLE_FILENAME}" "${BASH_COMMONS_EXECUTABLE_DIRECTORY}" "${BASH_COMMONS_EXECUTABLE_PATH}" "${BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL}" "${BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL}"
