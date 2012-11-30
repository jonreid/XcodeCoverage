These scripts provide a simple way to generate HTML reports of the code coverage
of your Xcode 4.5 project.


Installation
============

1. Fork this repository; you're probably going to want to make your own
modifications.
2. Place the XcodeCoverage folder in the same folder as your Xcode project.
3. [Dowload lcov-1.10](http://downloads.sourceforge.net/ltp/lcov-1.10.tar.gz).
Place the lcov-1.10 folder inside the XcodeCoverage folder.
4. In your Xcode project, enable these two build settings at the project level
for your Debug configuration only:
  * Instrument Program Flow
  * Generate Test Coverage Files
5. In your main target, add a Run Script build phase to execute
``XcodeCoverage/exportenv.sh``


Execution
=========

1. Run your unit tests
2. In Terminal, cd to your project's XcodeCoverage folder, then


    $ ./getcov


Modification
============

There are two places you may want to modify:

1. In envcov.sh, ``LCOV_INFO`` determines the name shown in the report.
2. In getcov, edit ``exclude_data()`` to change what code to exclude, for
example, third-party libraries.


More resources
==============

* [Sources](https://github.com/jonreid/XcodeCoverage)
* Testing tools: [OCHamcrest](https://github.com/hamcrest/OCHamcrest),
[OCMockito](https://github.com/jonreid/OCMockito),
[JMRTestTools](https://github.com/jonreid/JMRTestTools)
* [Quality Coding](http://qualitycoding.org/) blog - Tools, tips & techniques
for _building quality in_ to iOS development
