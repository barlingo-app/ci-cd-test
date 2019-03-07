#!/bin/bash

IF_PR=true

echo "Is a PR? $TRAVIS_PULL_REQUEST"
echo "Source branch: $TRAVIS_PULL_REQUEST_BRANCH"
echo "Target branch: $TRAVIS_BRANCH"

if [ "$TRAVIS_PULL_REQUEST" == "$IF_PR" ]; then
  echo "Merging PR into $TRAVIS_BRANCH"
 
  git fetch origin
  git checkout -b $TRAVIS_PULL_REQUEST_BRANCH origin/$TRAVIS_PULL_REQUEST_BRANCH
  git merge $TRAVIS_BRANCH
  
  git checkout $TRAVIS_BRANCH
  git merge --no-ff TRAVIS_PULL_REQUEST_BRANCH
  git push origin $TRAVIS_BRANCH

  git push --delete origin $TRAVIS_PULL_REQUEST_BRANCH
fi

exit 0
