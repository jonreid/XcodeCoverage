#!/bin/bash
x=`/usr/bin/osascript <<EOT
tell application "Finder"
	activate
	set myReply to button returned of (display dialog "Generate Code Coverage Report")
end tell
EOT`
if [[ $x = "OK" ]]; then 
echo 'Generating code coverage report'
cd ${SRCROOT}/XcodeCoverage && ./getcov && open ./lcov/index.html
fi
echo 'Done.'
