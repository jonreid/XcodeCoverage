![XcodeCoverage](http://qualitycoding.org/jrwp/wp-content/uploads/2014/03/XcodeCoverage.png)

These scripts provide a simple way to generate HTML reports of the code coverage
of your Xcode project.  


Installation
============

1. Fork this repository; you're probably going to want to make your own
modifications.
2. Place the XcodeCoverage folder in the same folder as your Xcode project.
3. Depending on your version of Xcode, you may need to get Xcode's coverage
instrumentation by going to Xcode Preferences, into Downloads, and installing
Command Line Tools.
4. In your Xcode project, enable these two build settings at the project level
for your Debug configuration only:
  * Instrument Program Flow
  * Generate Test Coverage Files
5. In your main target, add a Run Script build phase to execute
``XcodeCoverage/exportenv.sh``

A few people have been tripped up by the last step: Make sure you add the
script to your main target (your app or library), not your test target.


Execution
=========

1. Run your unit tests
2. In Terminal, execute `getcov` in your project's XcodeCoverage folder.

If you make changes to your test code without changing the production code and
want a clean slate, use the ``cleancov`` script.

If you make changes to your production code, you should clear out all build
artifacts before measuring code coverage again. "Clean Build Folder" by holding
down the Option key in Xcode's "Product" menu.

**Optional:** XcodeCoverage can prompt to run code coverage after running unit tests:

  * Edit Xcode scheme -> Test -> Post-actions
  * Set "Shell" to: ``/bin/bash``
  * Set "Provide build settings from" to your main target
  * Set script to:
  ``source ${SRCROOT}/XcodeCoverage/run_code_coverage_post.sh``


Modification
============

There are two places you may want to modify:

1. In envcov.sh, ``LCOV_INFO`` determines the name shown in the report.
2. In getcov, edit ``exclude_data()`` to specify which files to exclude, for
example, third-party libraries.
