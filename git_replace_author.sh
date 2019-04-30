#!/bin/sh
Args=("$@")

expandedArgs="arr=("
for cur in "${Args[@]}"
do
   expandedArgs="${expandedArgs} \"${cur}\""
done
expandedArgs="${expandedArgs} )"
echo ${expandedArgs}

git filter-branch -f --env-filter "${expandedArgs}"'
CORRECT_NAME="Jose Flavio A"
CORRECT_EMAIL="joseflavio-at-gmail-dot-com"

should_replace_committer=0
for curMail in "${arr[@]}"
do
	if [[ "$curMail" == "$GIT_COMMITTER_EMAIL" ]]; then
		should_replace_committer=1
	fi
done

should_replace_author=0
for curMail in "${arr[@]}"
do
	if [[ "$curMail" == "$GIT_COMMITTER_EMAIL" ]]; then
		should_replace_author=1
	fi
done

if [ "$should_replace_committer" -eq 1 ]; then
    export GIT_COMMITTER_NAME="$CORRECT_NAME"
    export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$should_replace_author" -eq 1 ]; then
    export GIT_AUTHOR_NAME="$CORRECT_NAME"
    export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

git shortlog --summary --number --email

# After: git push --force --tags origin 'refs/heads/*' master