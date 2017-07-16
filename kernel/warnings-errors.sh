#!/bin/bash
DeleteAllWerror(){
    local path="./"
    if [ -n "$1" ];then
        path="$1"
    fi
    local Makefiles=$(find $path -regex '.*\.mk$')
    sed 's:[[:space:]]*-Werror=.*[^     ]$::' -i ${Makefiles[@]}
    sed 's:-Werror[[:space:]]*::' -i ${Makefiles[@]}
    sed 's:[[:space:]]*-Werror$::' -i ${Makefiles[@]}
    sed 's:-Werror=.*[^     ][[:space:]]::' -i ${Makefiles[@]}
}
DeleteAllWerror $@

DeleteAll__user(){
    local Headers=$(find -regex '.*\.h')
    sed 's:[[:space:]]__user[[:space:]]: :' ${Headers[@]} -i
}
DeleteAll__user

DeleteAll__force(){
    local Headers=$(find -regex '.*\.h')
    sed 's:[[:space:]]__force[[:space:]]: :' ${Headers[@]} -i
}
DeleteAll__force
