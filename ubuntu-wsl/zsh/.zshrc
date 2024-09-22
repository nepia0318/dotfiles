### split zsh
ZSHHOME="${HOME}/.zsh"
PROFILE_ZSH="$ZSHHOME/.zprofile"
LOGIN_ZSH="$ZSHHOME/.zlogin"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then


    # Source the .zprofile file first
    if [ -f "$PROFILE_ZSH" -o -h "$PROFILE_ZSH" ] && [ -r "$PROFILE_ZSH" ]; then
        . "$PROFILE_ZSH"
    fi

    # Source the remaining zsh files
    for i in $ZSHHOME/.*; do
        if [ "$i" != "$PROFILE_ZSH" ] && [ "$i" != "$LOGIN_ZSH" ]; then
          [[ ${i##*/} = *.zsh ]] && [ \( -f $i -o -h $i \) -a -r $i ]  && . $i
        fi
    done

        # Source the .zlogin file last
    if [ -f "$LOGIN_ZSH" -o -h "$LOGIN_ZSH" ] && [ -r "$LOGIN_ZSH" ]; then
        . "$LOGIN_ZSH"
    fi
fi
