STATUS="$(git status)"

if [[ $STATUS == *"nothing to commit, working directory clean"* ]]
then
    sed -i '' '/public/d' ./.gitignore
    git add .
    git commit -m "Edit .gitignore to publish"
    git push master heroku:master --force
    git reset HEAD~
    git checkout .gitignore
else
    echo "Need clean working directory to publish"
fi
