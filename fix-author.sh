#!/bin/env bash
filter=$(cat <<'COMMIT_FILTER'
if [ "$GIT_AUTHOR_NAME" = "root" ];
then
    export GIT_COMMITTER_NAME="Carlos Jordão";
    export GIT_AUTHOR_NAME="Carlos Jordão";
    export GIT_COMMITTER_EMAIL="carlosjordao@gmail.com";
    export GIT_AUTHOR_EMAIL="carlosjordao@gmail.com";
fi;
git commit-tree "$@";
COMMIT_FILTER
);

git filter-branch -f --commit-filter "$filter" HEAD
