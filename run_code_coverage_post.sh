#!/bin/bash
x=`/usr/bin/osascript <<EOT
tell application "Finder"
  activate
  set myReply to button returned of (display dialog "Generate code coverage report?")
end tell
EOT`
if [[ $x = "OK" ]]; then 
  echo 'Generating code coverage report'
  ${SRCROOT}/XcodeCoverage/getcov
fi
echo 'Done.'
