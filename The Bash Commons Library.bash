#!/usr/bin/env bash
# This is a GNU Bash library to attempt to make lives easier.
# https://github.com/Lin-Buo-Ren/The-Bash-Commons-Library
# 林博仁 © 2016, 2017
# This file is released using WTFPL license
## Enable strict mode, make debugger happy
### Consider undefined variable as an error
set -o nounset

### Exit immediately if a pipeline, which may consist of a single simple command, a list, or a compound command returns a non-zero status.  The shell does not exit if the command that fails is part of the command list immediately following a `while' or `until' keyword, part of the test in an `if' statement, part of any command executed in a `&&' or `||' list except the command following the final `&&' or `||', any command in a pipeline but the last, or if the command's return status is being inverted with `!'.  If a compound command other than a subshell returns a non-zero status because a command failed while `-e' was being ignored, the shell does not exit.  A trap on `ERR', if set, is executed before the shell exits.
set -o errexit

### If set, any trap on `ERR' is inherited by shell functions, command substitutions, and commands executed in a subshell environment.  The `ERR' trap is normally not inherited in such cases.
set -o errtrace

### If set, the return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status, or zero if all commands in the pipeline exit successfully.
set -o pipefail

## Enable alias to support function aliases
shopt -s expand_aliases

## Define code for execution result
declare -ir BASH_COMMONS_RESULT_SUCCESS=0
declare -ir BASH_COMMONS_RESULT_FAILURE=1

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
bash_commons_array_indexed_access_element(){
	local -ir index=${1}; shift
	local -a array=("${@}")
	readonly array

	printf "%s" "${array[${index}]}"
	return ${BASH_COMMONS_RESULT_SUCCESS}
}

bash_commons_array_indexed_get_length(){
	local -nr array_reference=${1}

	printf "%s" ${#array_reference[@]}

	return ${BASH_COMMONS_RESULT_SUCCESS}
}

bash_commons_array_indexed_element_pop(){
	local -n array_reference=${1}

	if [ "${#array_reference[@]}" -eq 0 ]; then
		printf "The Bash Commons Library - bash_commons_array_indexed_element_pop - Error: array is null.\n" 1>&2
		return ${BASH_COMMONS_RESULT_FAILURE}
	else
		printf "${array_reference[0]}"

		unset array_reference[0]

		# repack array
		array_reference=("${array_reference[@]}")

		return ${BASH_COMMONS_RESULT_SUCCESS}
	fi
}

## Meta definitions and functions, just for Bash Commons itself ##
BASH_COMMONS_EXECUTABLE_FILENAME="$(basename "${BASH_SOURCE[0]}")"
readonly BASH_COMMONS_EXECUTABLE_FILENAME

BASH_COMMONS_EXECUTABLE_DIRECTORY="$(realpath --strip "$(dirname "${BASH_SOURCE[0]}")")"
readonly BASH_COMMONS_EXECUTABLE_DIRECTORY

declare -r BASH_COMMONS_EXECUTABLE_PATH="$(realpath --strip "${BASH_SOURCE[0]}")"

# Relative path (to the working directory) of the script
BASH_COMMONS_EXECUTABLE_PATH_RELATIVE="$(realpath --relative-to="${PWD}" --strip "${BASH_COMMONS_EXECUTABLE_PATH}")"
readonly BASH_COMMONS_EXECUTABLE_PATH_RELATIVE

declare -ir BASH_COMMONS_COMMANDLINE_ARGUMENT_QUANTITY="${#}"

declare -a BASH_COMMONS_COMMANDLINE_ARGUMENTS
if [ "$BASH_COMMONS_COMMANDLINE_ARGUMENT_QUANTITY" -eq 0 ]; then
	BASH_COMMONS_COMMANDLINE_ARGUMENTS=(nothing)
else
	BASH_COMMONS_COMMANDLINE_ARGUMENTS=("$@")
fi
readonly BASH_COMMONS_COMMANDLINE_ARGUMENTS

# BASH_COMMONS_COMMAND_BASE: The guessed user input command's executable (without the arguments), this is handy when showing help, where the proper command base can be displayed
# If ${RUNTIME_SCRIPTDIR} is in ${PATH}, this would be ${RUNTIME_SCRIPTNAME}, if not this would be ./${RUNTIME_SCRIPTPATH_RELATIVE}
declare BASH_COMMONS_COMMAND_BASE
declare -a BASH_COMMONS_PATH_DIRECTORIES=()
IFS=':' read -r -a BASH_COMMONS_PATH_DIRECTORIES <<< "${PATH}" || true # Without this `read` will return 1

declare pathdir
for pathdir in "${BASH_COMMONS_PATH_DIRECTORIES[@]}"; do
	if [ "${BASH_COMMONS_EXECUTABLE_DIRECTORY}" == "${pathdir}" ]; then
		BASH_COMMONS_COMMAND_BASE="${BASH_COMMONS_EXECUTABLE_FILENAME}"
		break
	fi
done
unset pathdir BASH_COMMONS_PATH_DIRECTORIES
readonly BASH_COMMONS_COMMAND_BASE="${BASH_COMMONS_COMMAND_BASE:-./${BASH_COMMONS_EXECUTABLE_PATH_RELATIVE}}"

declare -r BASH_COMMONS_PATH_TESTCASES="Test Cases"

bash_commons_meta_warn_before_errexit_abort(){
	local -ir line_error_location=${1}; shift # The line number that triggers the error
	local -r failing_command="${1}"; shift # The failing command
	local -ir failing_command_return_status=${1} # The failing command's return value

	printf "ERROR: This program has encountered an error and is ending prematurely, contact developer for support.\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "\"The Bash Commons Library\" by default sets Bash's \`errexit\` option, which will prematurely end the program if any command returns error status without being intercepted by the program.  You might need to recheck all the commands that will cause this behavior and if, the situation is intended and unavoidable, unset(\`set +o errexit\`) and reset(\`set -o errexit\`) errexit to escape the causing code section, for more information please refer Bash Manual - Shell Builtin Commands - Modifying Shell Behavior - The Set Builtin - \`-e\`.\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "You might want to customize this message by overriding the \"bash_commons_meta_warn_before_errexit_abort\" function.\n" 1>&2

	printf "\n" # Separate paragraphs

	printf "Technical information:\n"
	printf "\n" # Separate list title and items
	printf "	* The error happens at line %s\n" "${line_error_location}"
	printf "	* The failing command is \"%s\"\n" "${failing_command}"
	printf "	* Failing command's return status is %s\n" "${failing_command_return_status}"
	printf "	* Intepreter info: GNU Bash v%s on %s platform\n" "${BASH_VERSION}" "${MACHTYPE}"
	printf "\n" # Separate list and further content

	printf "Goodbye.\n"
	return
}
trap 'bash_commons_meta_warn_before_errexit_abort ${LINENO} "${BASH_COMMAND}" ${?}' ERR

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
	local -r bash_commons_command_base="${1}"

	printf "# The Bash Commons Library #\n"
	printf "Source this file to use the library, or run\n"
	printf "\n"
	printf "\t%s --unittest\n" "${bash_commons_command_base}"
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

	if [ "${test_result}" -eq ${BASH_COMMONS_RESULT_SUCCESS} ]; then
		printf "Passed\n"
	else
		printf "**FAILED**\n"
	fi

	printf "\n" # Trail blank line

	return
}

bash_commons_meta_unittest_test_file_exist(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - True if FILE exists"

	local -r path_file="${BASH_COMMONS_PATH_TESTCASES}/File"
	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}

	touch "${path_file}"

	if bash_commons_test_if_file_exist "${path_file}"; then
		if ! bash_commons_test_if_file_exist "${path_file}x"; then
			test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi

	rm "${path_file}"

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_alias_functions(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Commons Itself - Alias Functions"

	local -r path_file="${BASH_COMMONS_PATH_TESTCASES}/File"
	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}

	touch "${path_file}"

	if bash_test_if_file_exist "${path_file}"; then
		if bc_test_if_file_exist "${path_file}"; then
			if bc_is_file_exist "${path_file}"; then
				if ! bc_is_file_exist "${path_file}x"; then
					test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
				else
					test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
				fi
			else
				test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
			fi
		else
			test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi

	rm "${path_file}"

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_test_string_comparison(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - String Comparison"

	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}

	if bash_commons_test_if_strings_previous_lesser_than_latter "a" "b"; then
		if ! bash_commons_test_if_strings_previous_lesser_than_latter "b" "a"; then
			test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_test_integer_comparison(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Bash Conditional Expressions - Integer Comparison"

	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}

	if bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter 1 2; then
		if ! bash_commons_test_if_integers_previous_lesser_than_or_equal_to_latter 2 1; then
			test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi

	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_array_indexed_access_element(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Arrays - Access Element"

	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	local -ar array=(1 2 3)

	if [ "$(bash_commons_array_indexed_access_element 1 "${array[@]}")" = "2" ];then
		test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi
	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_array_indexed_length(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Arrays - Length of an Array"

	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	local -ar array_1=(1 2 3 4 5)
	local -ar array_null=()

	if [ "$(bash_commons_array_indexed_get_length array_1)" -eq 5 ]; then
		if [ "$(bash_commons_array_indexed_get_length array_null)" -eq 0 ]; then
			test_result_holder=${BASH_COMMONS_RESULT_SUCCESS}
		else
			test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
		fi
	else
		test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	fi
	bash_commons_meta_unittest_meta_end_test ${test_result_holder}
	return
}

bash_commons_meta_unittest_array_indexed_element_pop(){
	bash_commons_meta_unittest_meta_print_test_title "Bash Features - Arrays - Pop an element"

	local -i test_result_holder=${BASH_COMMONS_RESULT_FAILURE}
	local -i popped_element=0
	local -a array_1=(5 4 3 2 1)
	local -ar array_null=()

	# BUG: Aware, infinite loop!
	until [ "$(bash_commons_array_indexed_get_length array_1)" -eq 0 ]; do
		popped_element="$(bash_commons_array_indexed_element_pop array_1)"
		printf "%s " "${popped_element}"
	done
}

bash_commons_meta_unittest(){
	printf "# The Bash Commons Library UnitTest #\n"

	mkdir --parents "${BASH_COMMONS_PATH_TESTCASES}"

	bash_commons_meta_unittest_test_file_exist
	bash_commons_meta_unittest_alias_functions
	bash_commons_meta_unittest_test_string_comparison
	bash_commons_meta_unittest_test_integer_comparison
	bash_commons_meta_unittest_array_indexed_access_element
	bash_commons_meta_unittest_array_indexed_length
	bash_commons_meta_unittest_array_indexed_element_pop

	# Cleanup
	rm -rf "${BASH_COMMONS_PATH_TESTCASES}"
	return
}

bash_commons_meta_main(){
	local -r bash_commons_file_name="${1}"; shift
	local -r bash_commons_command_base="${1}"; shift
	local -ir bash_commons_commandline_argument_quantity="${1}"; shift
	local -a bash_commons_commandline_argument_list=("${@}")
	# `local -ar` somehow doesn't work("bash_commons_commandline_argument_list: readonly variable")
	readonly bash_commons_commandline_argument_list

	# If source'd but not run, don't do anything
	if ! echo "${bash_commons_file_name}" | grep --quiet "The Bash Commons Library" ; then
		return
	fi

	# If no command-line arguments, print help info and exit
	if [ "${bash_commons_commandline_argument_quantity}" -eq 0 ]; then
		bash_commons_meta_print_help "${bash_commons_command_base}"
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

bash_commons_meta_main "${BASH_COMMONS_EXECUTABLE_FILENAME}" "${BASH_COMMONS_COMMAND_BASE}" "${BASH_COMMONS_COMMANDLINE_ARGUMENT_QUANTITY}" "${BASH_COMMONS_COMMANDLINE_ARGUMENTS[@]}"
