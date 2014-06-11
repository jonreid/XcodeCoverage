#!/bin/bash
button=`/usr/bin/osascript <<EOT
tell application "Finder"
  activate
  set dialogText to "Generate code coverage report?"
  set cancelText to "Cancel"
  set okText to "OK"
  set myReply to button returned of (display dialog dialogText buttons {cancelText, okText} cancel button cancelText default button okText)
end tell
EOT`
if [[ $button = "OK" ]]; then 
  echo "Generating code coverage report"
  ${SRCROOT}/XcodeCoverage/getcov
fi
echo "Done."
