#!/bin/sh

if [[ "$TRAVIS_PULL_REQUEST" = "true" ]]; then
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
