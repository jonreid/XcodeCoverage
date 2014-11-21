![XcodeCoverage](http://qualitycoding.org/jrwp/wp-content/uploads/2014/03/XcodeCoverage.png)

These scripts provide a simple way to generate HTML reports of the code coverage of your Xcode project.  


Xcode Project Setup
===================

Before you get started, there are a couple of steps you will need to take to prepare your project: 

1. Depending on your version of Xcode, you may need to get Xcode's coverage instrumentation by going to Xcode > Preferences, into Downloads, and installing Command Line Tools. If you do not see this as an option in the Downloads section, the tools should already be installed. 
4. In your Xcode project, enable these two build settings at the project level for your Debug configuration only:
	* Instrument Program Flow
	* Generate Test Coverage Files


Installation: Standard
======================

1. Fork this repository; you're probably going to want to make your own modifications.
2. Place the XcodeCoverage folder in the same folder as your Xcode project.
5. In your main target, add a Run Script build phase to execute `XcodeCoverage/exportenv.sh`

A few people have been tripped up by the last step: Make sure you add the script to your main target (your app or library), not your test target.


Installation: CocoaPods
=======================

A [CocoaPod](http://cocoapods.org/) has been added for convenient use in simple projects. There are a couple of things you should be aware of if you are using the CocoaPod instead of the standard method: 

- There will be no actual files added to your project. Files are only added through `preserve_paths`, so they will be available in your `Pods/XcodeCoverage` path, but you will not see them in Xcode, and they will not be compiled by Xcode.
- You will not be able to modify the scripts without those modifications being potentially overwritten by CocoaPods. 

If those caveats are deal-breakers, please use the standard installation method above. 

The steps to install via CocoaPods: 

1. Add `pod 'XcodeCoverage', '~>1.0'` (or whatever [version specification](http://guides.cocoapods.org/using/the-podfile.html#specifying-pod-versions) you desire) to your Podfile. 
2. Run `pod install`. This will download the necessary files.
3. In your main target, add a Run Script build phase to execute
`Pods/XcodeCoverage/exportenv.sh`. 

Again, make sure you add the script to your main target (your app or library), not your test target.


Execution
=========

Immediately after installation, run your application at least once to generate the `env.sh` file, which will be placed at the same level as your `.xcodeproj` folder. This file should *not* be checked into version control, since it contains paths local to your machine. 

Once that task has been completed, the process is very simple: 

1. Run your unit tests.
2. In Terminal, execute `getcov` in your project's XcodeCoverage folder.

If you make changes to your test code without changing the production code and want a clean slate, use the `cleancov` script.

If you make changes to your production code, you should clear out all build
artifacts before measuring code coverage again. "Clean Build Folder" by holding down the Option key in Xcode's "Product" menu.

**Optional:** XcodeCoverage can prompt to run code coverage after running unit tests:

  * Edit Xcode scheme -> Test -> Post-actions
  * Set "Shell" to: `/bin/bash`
  * Set "Provide build settings from" to your main target
  * Set script to: `source ${SRCROOT}/XcodeCoverage/run_code_coverage_post.sh`


Modification
============

There are two places you may want to modify the included files if you are using the standard installation:

1. In `envcov.sh`, `LCOV_INFO` determines the name shown in the report.
2. In `getcov`, edit `exclude_data()` to specify which files to exclude, for example, third-party libraries.
