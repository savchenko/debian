#!/usr/bin/env bash

SCRIPTPATH="/usr/local/bin"
CZMODPATH="/usr/local/bin/czmod"
CZPATH=$SCRIPTPATH
PATH="$CZPATH:$PATH"

if [ ! -x "$CZMODPATH" ]; then
	echo "Error: Could not find czmod executable"
	return
fi

case "$PROMPT_COMMAND" in
	*_zlua?--add*)
		PROMPT_COMMAND="${PROMPT_COMMAND/_zlua?--add/czmod --add}"
		;;
	*czmod?--add*)
		;;
	*_zlua_precmd*)
		;;
	*)
		echo "z.lua is not initialized"
		;;
esac

_zlua_precmd() {
    [ "$_ZL_PREVIOUS_PWD" = "$PWD" ] && return
    _ZL_PREVIOUS_PWD="$PWD"
    (czmod --add "$PWD" 2> /dev/null &)
}
