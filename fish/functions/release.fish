function release
  set RELEASE_NAME $argv[1]
  set CURRENT_FOLDER (basename (pwd))
  set LATEST_TAG (git describe --tags --abbrev=0)
  set MERGES (git log --oneline --decorate --graph --merges "$LATEST_TAG"..HEAD)

  set RELEASE_MESSAGE """@here I am going to release $CURRENT_FOLDER

Product: `$CURRENT_FOLDER $RELEASE_NAME`
Release URL:

```
## Under the Hood


## Bug Fixes


## Merged PRs

$MERGES
```
"""

  echo $RELEASE_MESSAGE
  git tag $argv[1]
  echo $RELEASE_MESSAGE | pbcopy

  echo "The release message is in your clipboard. Paste it in your favorite editor and add the human readable features and bug fixes and then paste it in slack"
end
