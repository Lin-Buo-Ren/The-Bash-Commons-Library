#!/usr/bin/env bash
# This is a GNU Bash library to attempt to make lives easier.
# https://github.com/Lin-Buo-Ren/The-Bash-Commons-Library
# 林博仁 © 2016
# This file is released using WTFPL license
# Consider undefined variable as an error
set -o nounset

# Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.  The shell does not exit if the command that fails is part of the command list immediately following a `while' or `until' keyword, part of the test in an `if' statement, part of any command executed in a `&&' or `||' list except the command following the final `&&' or `||', any command in a pipeline but the last, or if the command's return status is being inverted with `!'.  If a compound command other than a subshell returns a non-zero status because a command failed while `-e' was being ignored, the shell does not exit.  A trap on `ERR', if set, is executed before the shell exits.
set -o errexit
set -o errtrace

# If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -o pipefail

# Enable alias to support function aliases
shopt -s expand_aliases

## Meaningful Bash Conditional Expressions ##
### File Existance ###
bash_commons_test_if_file_exist(){
	local file_path="${1}"

	test -e "${file_path}"
# 	Causes a function or sourced script to exit with the return value
#   specified by N.  If N is omitted, the return status is that of the
#   last command executed within the function or script.
	return
}
alias bash_test_if_file_exist=bash_commons_test_if_file_exist
alias bc_test_if_file_exist=bash_commons_test_if_file_exist
alias bc_is_file_exist=bash_commons_test_if_file_exist

### File Type ###
bash_commons_test_if_file_regular(){
	local file_path="${1}"

	test -f "${file_path}"
	return
}
alias bash_test_if_file_regular=bash_commons_test_if_file_regular
alias bc_test_if_file_regular=bash_commons_test_if_file_regular
alias bc_is_file_regular=bash_commons_test_if_file_regular

bash_commons_test_if_file_directory(){
	local file_path="${1}"

	test -d "${file_path}"
	return
}
alias bash_test_if_file_directory=bash_commons_test_if_file_directory
alias bc_test_if_file_directory=bash_commons_test_if_file_directory
alias bc_is_file_directory=bash_commons_test_if_file_directory

bash_commons_test_if_file_symbolic_link(){
	local file_path="${1}"

	test -h "${file_path}"
	return
}
alias bash_test_if_file_symbolic_link=bash_commons_test_if_file_symbolic_link
alias bc_test_if_file_symbolic_link=bash_commons_test_if_file_symbolic_link
alias bc_is_file_symbolic_link=bash_commons_test_if_file_symbolic_link

bash_commons_test_if_file_block_special(){
	local file_path="${1}"

	test -b "${file_path}"
	return
}
alias bash_test_if_file_block_special=bash_commons_test_if_file_block_special
alias bc_test_if_file_block_special=bash_commons_test_if_file_block_special
alias bc_is_file_block_special=bash_commons_test_if_file_block_special

bash_commons_test_if_file_character_special(){
	local file_path="${1}"

	test -c "${file_path}"
	return
}
alias bash_test_if_file_character_special=bash_commons_test_if_file_character_special
alias bc_test_if_file_character_special=bash_commons_test_if_file_character_special
alias bc_is_file_character_special=bash_commons_test_if_file_character_special

bash_commons_test_if_file_named_pipe(){
	local file_path="${1}"

	test -p "${file_path}"
	return
}
alias bash_test_if_file_named_pipe=bash_commons_test_if_file_named_pipe
alias bc_test_if_file_named_pipe=bash_commons_test_if_file_named_pipe
alias bc_is_file_named_pipe=bash_commons_test_if_file_named_pipe

bash_commons_test_if_file_socket(){
	local file_path="${1}"

	test -S "${file_path}"
	return
}
alias bash_test_if_file_socket=bash_commons_test_if_file_socket
alias bc_test_if_file_socket=bash_commons_test_if_file_socket
alias bc_is_file_socket=bash_commons_test_if_file_socket

### File Ownership and Permissions ###
bash_commons_test_if_file_owned_by_effective_user_id(){
	local file_path="${1}"

	test -O "${file_path}"
	return
}
alias bash_test_if_file_owned_by_effective_user_id=bash_commons_test_if_file_owned_by_effective_user_id
alias bc_test_if_file_owned_by_effective_user_id=bash_commons_test_if_file_owned_by_effective_user_id
alias bc_is_file_owned_by_effective_user_id=bash_commons_test_if_file_owned_by_effective_user_id

bash_commons_test_if_file_owned_by_effective_group_id(){
	local file_path="${1}"

	test -G "${file_path}"
	return
}
alias bash_test_if_file_owned_by_effective_group_id=bash_commons_test_if_file_owned_by_effective_group_id
alias bc_test_if_file_owned_by_effective_group_id=bash_commons_test_if_file_owned_by_effective_group_id
alias bc_is_file_owned_by_effective_group_id=bash_commons_test_if_file_owned_by_effective_group_id

bash_commons_test_if_file_readable(){
	local file_path="${1}"

	test -r "${file_path}"
	return
}
alias bash_test_if_file_readable=bash_commons_test_if_file_readable
alias bc_test_if_file_readable=bash_commons_test_if_file_readable
alias bc_is_file_readable=bash_commons_test_if_file_readable

bash_commons_test_if_file_writable(){
	local file_path="${1}"

	test -w "${file_path}"
	return
}
alias bash_test_if_file_writable=bash_commons_test_if_file_writable
alias bc_test_if_file_writable=bash_commons_test_if_file_writable
alias bc_is_file_writable=bash_commons_test_if_file_writable

bash_commons_test_if_file_executable(){
	local file_path="${1}"

	test -x "${file_path}"
	return
}
alias bash_test_if_file_executable=bash_commons_test_if_file_executable
alias bc_test_if_file_executable=bash_commons_test_if_file_executable
alias bc_is_file_executable=bash_commons_test_if_file_executable

bash_commons_test_if_file_suid_bit_set(){
	local file_path="${1}"

	test -u "${file_path}"
	return
}
alias bash_test_if_file_suid_bit_set=bash_commons_test_if_file_suid_bit_set
alias bc_test_if_file_suid_bit_set=bash_commons_test_if_file_suid_bit_set
alias bc_is_file_suid_bit_set=bash_commons_test_if_file_suid_bit_set

bash_commons_test_if_file_sgid_bit_set(){
	local file_path="${1}"

	test -g "${file_path}"
	return
}
alias bash_test_if_file_sgid_bit_set=bash_commons_test_if_file_sgid_bit_set
alias bc_test_if_file_sgid_bit_set=bash_commons_test_if_file_sgid_bit_set
alias bc_is_file_sgid_bit_set=bash_commons_test_if_file_sgid_bit_set

bash_commons_test_if_file_sticky_bit_set(){
	local file_path="${1}"

	test -k "${file_path}"
	return
}
alias bash_test_if_file_sticky_bit_set=bash_commons_test_if_file_sticky_bit_set
alias bc_test_if_file_sticky_bit_set=bash_commons_test_if_file_sticky_bit_set
alias bc_is_file_sticky_bit_set=bash_commons_test_if_file_sticky_bit_set

### File-related Time ###
bash_commons_test_if_file_modified(){
	local file_path="${1}"

	test -N "${file_path}"
	return
}
alias bash_test_if_file_modified=bash_commons_test_if_file_modified
alias bc_test_if_file_modified=bash_commons_test_if_file_modified
alias bc_is_file_modified=bash_commons_test_if_file_modified

bash_commons_test_if_previous_file_is_newer_than_latter(){
	local previous_file="${1}"; shift
	local latter_file="${1}"

	test -nt "${previous_file}" "${latter_file}"
	return
}
alias bash_test_if_previous_file_is_newer_than_latter=bash_commons_test_if_previous_file_is_newer_than_latter
alias bc_test_if_previous_file_is_newer_than_latter=bash_commons_test_if_previous_file_is_newer_than_latter
alias bc_is_previous_file_is_newer_than_latter=bash_commons_test_if_previous_file_is_newer_than_latter

bash_commons_test_if_previous_file_is_older_than_latter(){
	local previous_file="${1}"; shift
	local latter_file="${1}"

	test -ot "${previous_file}" "${latter_file}"
	return
}
alias bash_test_if_previous_file_is_older_than_latter=bash_commons_test_if_previous_file_is_older_than_latter
alias bc_test_if_previous_file_is_older_than_latter=bash_commons_test_if_previous_file_is_older_than_latter
alias bc_is_previous_file_is_older_than_latter=bash_commons_test_if_previous_file_is_older_than_latter

### File Size Comparison ###
bash_commons_test_if_file_not_empty(){
	local file_path="${1}"

	test -N "${file_path}"
	return
}
alias bash_test_if_file_not_empty=bash_commons_test_if_file_not_empty
alias bc_test_if_file_not_empty=bash_commons_test_if_file_not_empty
alias bc_is_file_not_empty=bash_commons_test_if_file_not_empty

bash_commons_test_if_file_empty(){
	local file_path="${1}"

	! test -N "${file_path}"
	return
}
alias bash_test_if_file_empty=bash_commons_test_if_file_empty
alias bc_test_if_file_empty=bash_commons_test_if_file_empty
alias bc_is_file_empty=bash_commons_test_if_file_empty

### String Comparison ###
bash_commons_test_if_strings_are_equal(){
	local string_a="${1}"; shift
	local string_b="${1}"

	test "${string_a}" = "${string_b}"
	return
}
alias bash_test_if_strings_are_equal=bash_commons_test_if_strings_are_equal
alias bc_test_if_strings_are_equal=bash_commons_test_if_strings_are_equal
alias bc_is_strings_are_equal=bash_commons_test_if_strings_are_equal
alias bc_is_strings_equal=bash_commons_test_if_strings_are_equal

bash_commons_test_if_strings_are_not_equal(){
	local string_a="${1}"; shift
	local string_b="${1}"

	test "${string_a}" != "${string_b}"
	return
}
alias bash_test_if_strings_are_not_equal=bash_commons_test_if_strings_are_not_equal
alias bc_test_if_strings_are_not_equal=bash_commons_test_if_strings_are_not_equal
alias bc_is_strings_are_not_equal=bash_commons_test_if_strings_are_not_equal
alias bc_is_strings_not_equal=bash_commons_test_if_strings_are_not_equal
alias bc_is_strings_unequal=bash_commons_test_if_strings_are_not_equal

bash_commons_test_if_strings_previous_lesser_than_latter(){
	local string_a="${1}"; shift
	local string_b="${1}"

	test "${string_a}" \< "${string_b}" # NOTE: Escaping is required to prevent being translated as the redirection operator
	return
}
alias bash_test_if_strings_previous_lesser_than_latter=bash_commons_test_if_strings_previous_lesser_than_latter
alias bc_test_if_strings_previous_lesser_than_latter=bash_commons_test_if_strings_previous_lesser_than_latter
alias bc_is_strings_previous_lesser_than_latter=bash_commons_test_if_strings_previous_lesser_than_latter

bash_commons_test_if_strings_previous_greater_than_latter(){
	local -r string_a="${1}"; shift
	local -r string_b="${1}"

	test "${string_a}" \> "${string_b}" # NOTE: Escaping is required to prevent being translated as the redirection operator
	return
}
alias bash_test_if_strings_previous_greater_than_latter=bash_commons_test_if_strings_previous_greater_than_latter
alias bc_test_if_strings_previous_greater_than_latter=bash_commons_test_if_strings_previous_greater_than_latter
alias bc_is_strings_previous_greater_than_latter=bash_commons_test_if_strings_previous_greater_than_latter

### Arithmetic Operations ###
bash_commons_test_if_integers_are_equal(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -eq "${integer_b}"
}
alias bash_test_if_integers_are_equal=bash_commons_test_if_integers_are_equal
alias bc_test_if_integers_are_equal=bash_commons_test_if_integers_are_equal
alias bc_is_integers_are_equal=bash_commons_test_if_integers_are_equal
alias bc_is_integers_equal=bash_commons_test_if_integers_are_equal

bash_commons_test_if_integers_are_not_equal(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -ne "${integer_b}"
}
alias bash_test_if_integers_are_not_equal=bash_commons_test_if_integers_are_not_equal
alias bc_test_if_integers_are_not_equal=bash_commons_test_if_integers_are_not_equal
alias bc_is_integers_are_not_equal=bash_commons_test_if_integers_are_not_equal
alias bc_is_integers_not_equal=bash_commons_test_if_integers_are_not_equal
alias bc_is_integers_unequal=bash_commons_test_if_integers_are_not_equal

bash_commons_test_if_integers_previous_lesser_than_latter(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -lt "${integer_b}"
}
alias bash_test_if_integers_previous_lesser_than_latter=bash_commons_test_if_integers_previous_lesser_than_latter
alias bc_test_if_integers_previous_lesser_than_latter=bash_commons_test_if_integers_previous_lesser_than_latter
alias bc_is_integers_previous_lesser_than_latter=bash_commons_test_if_integers_previous_lesser_than_latter

bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -le "${integer_b}"
}
alias bash_test_if_integers_previous_lesser_than_or_equal_to_latter=bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter
alias bc_test_if_integers_previous_lesser_than_or_equal_to_latter=bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter
alias bc_is_integers_previous_lesser_than_or_equal_to_latter=bash_commons_test_if_integers_previous_lesser_than_latter

bash_commons_test_if_integers_previous_greater_then_latter(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -gt "${integer_b}"
}
alias bash_test_if_integers_previous_greater_than_latter=bash_commons_test_if_integers_previous_greater_then_latter
alias bc_test_if_integers_previous_greater_than_latter=bash_commons_test_if_integers_previous_greater_then_latter
alias bc_is_integers_previous_greater_than_latter=bash_commons_test_if_integers_previous_greater_then_latter

bash_commons_test_if_integers_previous_greater_than_or_equal_to_latter(){
	local -ir integer_a="${1}"; shift
	local -ir integer_b="${1}"

	test "${integer_a}" -ge "${integer_b}"
}
alias bash_test_if_integers_previous_greater_than_or_equal_to_latter=bash_commons_test_if_integers_previous_greater_than_or_equal_to_latter
alias bc_test_if_integers_previous_greater_than_or_equal_to_latter=bash_commons_test_if_integers_previous_greater_than_or_equal_to_latter
alias bc_is_integers_previous_greater_than_or_equal_to_latter=bash_commons_test_if_integers_previous_lesser_than_latter

### M. ###
bash_commons_test_if_files_refer_same_device_and_inode_number(){
	local -ir file_a="${1}"; shift
	local -ir file_b="${1}"

	test "${file_a}" -ef "${file_b}"
	return
}
alias bash_test_if_files_refer_same_device_and_inode_number=bash_commons_test_if_files_refer_same_device_and_inode_number
alias bc_test_if_files_refer_same_device_and_inode_number=bash_commons_test_if_files_refer_same_device_and_inode_number
alias bc_is_files_refer_same_device_and_inode_number=bash_commons_test_if_files_refer_same_device_and_inode_number
alias bc_is_files_same_inode=bash_commons_test_if_files_refer_same_device_and_inode_number

bash_commons_test_if_file_descriptor_refer_to_open_terminal(){
	local file_path="${1}"

	test -t "${file_path}"
	return
}
alias bash_test_if_file_descriptor_refer_to_open_terminal=bash_commons_test_if_file_descriptor_refer_to_open_terminal
alias bc_test_if_file_descriptor_refer_to_open_terminal=bash_commons_test_if_file_descriptor_refer_to_open_terminal
alias bc_is_file_descriptor_refer_to_open_terminal=bash_commons_test_if_file_descriptor_refer_to_open_terminal
alias bc_is_fd_open_terminal=bash_commons_test_if_file_descriptor_refer_to_open_terminal

## Bash Features - Arrays - Simple Indexed Array ##
bash_commons_array_indexed_access_integer(){
	local -ir index=${1}; shift
	local -a array=("${@}")
	readonly array

	printf "%s" "${array[${index}]}"
	return
}

## Meta definitions and functions, just for Bash Commons itself ##
BASH_COMMONS_EXECUTABLE_FILENAME="$(basename "${0}")"
readonly BASH_COMMONS_EXECUTABLE_FILENAME

BASH_COMMONS_EXECUTABLE_DIRECTORY="$(realpath --relative-to="$(pwd)" --no-symlinks "$(dirname "${0}")")"
readonly BASH_COMMONS_EXECUTABLE_DIRECTORY

declare -r BASH_COMMONS_EXECUTABLE_PATH="${BASH_COMMONS_EXECUTABLE_DIRECTORY}/${BASH_COMMONS_EXECUTABLE_FILENAME}"

declare -ir BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL="${#}"

declare -a BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL
if [ "$BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL" -eq 0 ]; then
	BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL=(nothing)
else
	BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL=("$@")
fi
readonly BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL

declare -r BASH_COMMONS_PATH_TESTCASES="Test Cases"
declare -ir BASH_COMMONS_UNITTEST_SUCCESS=0
declare -ir BASH_COMMONS_UNITTEST_FAILURE=1

bash_commons_meta_warn_before_errexit_abort(){
	local -ir line_error_location=${1}; shift
	local -ir command_return_status=${1}

	printf "ERROR: This program has encountered an error and is ending prematurely, contact developer for support.\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "INFO: Technical information: \"The Bash Commons Library\" by default sets Bash's \`errexit\` option, which will prematurely end the program if any command returns error status without being intercepted by the program.  You might need to recheck all the commands that will cause this behavior and if, the situation is intended and unavoidable, unset(\`set +o errexit\`) and reset(\`set -o errexit\`) errexit to escape the causing code section, for more information please refer Bash Manual - Shell Builtin Commands - Modifying Shell Behavior - The Set Builtin - \`-e\`.\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "INFO: Technical information: You might want to customize this message using \`trap\` command, refer Bash Manual - Shell Builtin Commands - Bourne Shell Builtins - \`trap\`\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "INFO: Technical information: The error happens at line %s, command return status is %s.\n" "${line_error_location}" "${command_return_status}"
	return
}
trap 'bash_commons_meta_warn_before_errexit_abort ${LINENO} ${?}' ERR

bash_commons_meta_info_before_normal_exit(){
	printf -- "------------------------------------\n"
	printf "The Bash Commons Library\n"
	printf "林博仁 et. al. © 2017\n"
	printf "Official Website: https://github.com/Lin-Buo-Ren/The-Bash-Commons-Library\n"
	printf "Intellectual Property License: WTFPL\n"

	return
}
trap 'bash_commons_meta_info_before_normal_exit' EXIT

bash_commons_meta_print_help(){
	local -r bash_commons_file_path="${1}"

	printf "# The Bash Commons Library #\n"
	printf "Source this file to use the library, or run\n"
	printf "\n"
	printf "\t%s --unittest\n" "${bash_commons_file_path}"
	printf "\n"
	printf "for unittest.\n"
	return
}

bash_commons_meta_unittest_meta_print_test_title(){
	local -r test_title="${1}"

	printf "## %s() ##\n" "${test_title}"
	return
}

bash_commons_meta_unittest_meta_end_test(){
	local -ir test_result=${1}

	if [ "${test_result}" -eq ${BASH_COMMONS_UNITTEST_SUCCESS} ]; then
		printf "Passed\n"
	else
		printf "**FAILED**\n"
	fi

	printf "\n" # Trail blank line

	return
}

bash_commons_meta_unittest_test_file_exist(){
	local -r path_file="${BASH_COMMONS_PATH_TESTCASES}/File"
	local -i test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}

	touch "${path_file}"

	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - True if FILE exists"

	if bash_commons_test_if_file_exist "${path_file}"; then
		if ! bash_commons_test_if_file_exist "${path_file}x"; then
			test_result_holder=${BASH_COMMONS_UNITTEST_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	fi

	rm "${path_file}"

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_alias_functions(){
	local -r path_file="${BASH_COMMONS_PATH_TESTCASES}/File"
	local -i test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}

	touch "${path_file}"

	bash_commons_meta_unittest_meta_print_test_title "Bash Commons Itself - Alias Functions"

	if bash_test_if_file_exist "${path_file}"; then
		if bc_test_if_file_exist "${path_file}"; then
			if bc_is_file_exist "${path_file}"; then
				if ! bc_is_file_exist "${path_file}x"; then
					test_result_holder=${BASH_COMMONS_UNITTEST_SUCCESS}
				else
					test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
				fi
			else
				test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
			fi
		else
			test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	fi

	rm "${path_file}"

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_test_string_comparison(){
	local -i test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}

	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - String Comparison"

	if bash_commons_test_if_strings_previous_lesser_than_latter "a" "b"; then
		if ! bash_commons_test_if_strings_previous_lesser_than_latter "b" "a"; then
			test_result_holder=${BASH_COMMONS_UNITTEST_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	fi

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_test_integer_comparison(){
	local -i test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}

	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - Integer Comparison"

	if bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter 1 2; then
		if ! bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter 2 1; then
			test_result_holder=${BASH_COMMONS_UNITTEST_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	fi

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_array_indexed_access_integer(){
	local -i test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	local -ar array=(1 2 3)
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Arrays - Access Integer"

	if [ "$(bash_commons_array_indexed_access_integer 1 "${array[@]}")" = "2" ];then
		test_result_holder=${BASH_COMMONS_UNITTEST_SUCCESS}
	else
		test_result_holder=${BASH_COMMONS_UNITTEST_FAILURE}
	fi
	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest(){
	printf "# The Bash Commons Library UnitTest #\n"

	mkdir --parents "${BASH_COMMONS_PATH_TESTCASES}"

	bash_commons_meta_unittest_test_file_exist
	bash_commons_meta_unittest_alias_functions
	bash_commons_meta_unittest_test_string_comparison
	bash_commons_meta_unittest_test_integer_comparison
	bash_commons_meta_unittest_array_indexed_access_integer

	# Cleanup
	rm -rf "${BASH_COMMONS_PATH_TESTCASES}"
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
	# FIXME: Implement this after array access is implemented, for now we simply assume that 1 argument means unittest
	if [ "${bash_commons_commandline_argument_quantity}" -eq 1 ]; then
		printf "Warning: assuming --unittest, run this program without command-line arguments to see usage.\n" 1>&2
		bash_commons_meta_unittest
		exit 0
	fi
}

bash_commons_meta_main "${BASH_COMMONS_EXECUTABLE_FILENAME}" "${BASH_COMMONS_EXECUTABLE_DIRECTORY}" "${BASH_COMMONS_EXECUTABLE_PATH}" "${BASH_COMMONS_COMMANDLINE_ARGUMENT_NUMBER_ORIGINAL}" "${BASH_COMMONS_COMMANDLINE_ARGUMENT_LIST_ORIGINAL}"
