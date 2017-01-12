#!/usr/bin/env bash
# This is a GNU Bash library to attempt to make lives easier.
# https://github.com/Lin-Buo-Ren/The-Bash-Commons-Library
# 林博仁 © 2016
# This file is released using WTFPL license

## Meaninful Bash Conditional Expressions ##
bash_commons_test_if_file_exist(){
	local file_path="${1}"

	test -a "$file_path"
# 	Causes a function or sourced script to exit with the return value
#   specified by N.  If N is omitted, the return status is that of the
#   last command executed within the function or script.
	return
}
bash_test_if_file_exist(){
	local file_path="${1}"

	bash_commons_test_if_file_exist "${file_path}"
	return
}
bc_test_if_file_exist(){
	local file_path="${1}"

	bash_commons_test_if_file_exist "${file_path}"
	return
}
bc_is_file_exist(){
	local file_path="${1}"

	bash_commons_test_if_file_exist "${file_path}"
	return
}

bash_commons_meta_main(){
	if ! echo "${0}" | grep --quiet "The Bash Commons Library" ; then
		# Script is source'd instead of run, don't do anything
		return
	fi
	printf "# The Bash Commons Library #\n"
	printf "Source this file to use the library, or run\n"
	printf "\n"
	printf "\t%s --demonstration\n" "${0}"
	printf "\n"
	printf "for demonstration.\n"
}
bash_commons_meta_main
