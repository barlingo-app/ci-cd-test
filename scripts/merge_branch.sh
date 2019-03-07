#!/bin/bash

NOT_PR=false

echo "Source branch: $TRAVIS_PULL_REQUEST_BRANCH"
echo "Target branch: $TRAVIS_BRANCH"

if [ "$TRAVIS_PULL_REQUEST" != "$NOT_PR" ]; then
  echo "Merging PR into $TRAVIS_BRANCH"

  echo $SSH_KEY > ~/.ssh/id_rsa.pub
  ssh-keyscan -H github.com >> ~/.ssh/known_hosts

  git remote add upstream git@github.com:barlingo-app/ci-cd-test.git

  git fetch upstream
  git checkout $TRAVIS_PULL_REQUEST_BRANCH
  git merge $TRAVIS_BRANCH
  
  git checkout $TRAVIS_BRANCH
  git merge --no-ff $TRAVIS_PULL_REQUEST_BRANCH
  git push upstream $TRAVIS_BRANCH

  git push --delete upstream $TRAVIS_PULL_REQUEST_BRANCH
fi

exit 0
