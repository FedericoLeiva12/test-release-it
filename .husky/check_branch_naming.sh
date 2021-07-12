#!/usr/bin/env bash
local_branch_name="$(git rev-parse --abbrev-ref HEAD)"

valid_branch_regex='^((feature|bugfixing|hotfix)\/GL-[0-9]{1,}(\-[a-zA-Z0-9\-]{1,})?)$'

message="Hay algo mal con el nombre de tu branch. Esta debe estar compuesta por lo siguiente: TYPE/GL-XX-NAME ($valid_branch_regex). Cambia el nombre de tu branch con el comando \"git branch -m TYPE/GL-XX-NAME\" \nTipos de branch válidos:\nfeature - bugfixing - hotfix"

if [[ ! $local_branch_name =~ $valid_branch_regex ]]; then
    echo "$message"
    exit 1
fi

exit 0