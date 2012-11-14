

'From Pharo1.4a of ''16 June 2011'' [Latest update: #14385] on 9 March 2012 at 8:50:12 pm'!
Parser subclass: #MockCustomParser
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'CompilerTests'!


| log |

[	

"FuelTests
FuelMetalevelTests
FuelPackageLoaderTests
"

'SUnit-Core
SUnit-Tests
CollectionsTests
Announcements-Tests-Core
CompilerTests
CompressionTests
FileSystem-Tests-AnsiStreams
FileSystem-Tests-Core
FileSystem-Tests-Disk
FileSystem-Tests-Memory
KernelTests
Multilingual-Tests
Ring-Tests-Kernel
Ring-Tests-Containers
Tests-Bugs
Tests-CodeImport
Tests-Compression
Tests-Exceptions
Tests-Files
Tests-Finalization
Tests-Localization
Tests-Object Events
Tests-ObjectsAsMethods
Tests-Release
FooSharedPool
Tests-System
Tests-System-CommandLine
Tests-SystemChangeNotification
Tests-SystemTests-Support
Tests-Traits
Tests-Traits-MOP
Tests-VM
HudsonBuildTools' linesDo: [:packageName |

CodeImporter evaluateReadStream: (packageName, '.st') asFileReference readStream.

FileStream stdout nextPutAll: packageName, ' loaded'; lf.].

FileStream stdout nextPutAll: 'Load tests finished'; lf.

(Smalltalk at: #TextDiffBuilderTest) removeFromSystem.
(Smalltalk at: #StickynessBugz) removeFromSystem.
(Smalltalk at: #RenderBugz) removeFromSystem.
(Smalltalk at: #MorphicUIBugTest) removeFromSystem.
(Smalltalk at: #MorphBugs) removeFromSystem.
(Smalltalk at: #HandBugs) removeFromSystem.
(Smalltalk at: #CircleMorphBugs) removeFromSystem.

(Smalltalk at: #ReleaseTest) removeSelector: #testRPackageOrganizer. 
(Smalltalk at: #ReleaseTest) removeSelector: #testUnpackagedClasses. 

SmalltalkImage current snapshot: true andQuit: true.


] ifError: [:e |
	| rep |
	rep := FileStream forceNewFileNamed: 'PharoDebug.log'.
	rep nextPutAll: 'Error:'; cr.
	rep nextPutAll: e asString; cr.
	rep nextPutAll: thisContext stack size asString; cr.
"	rep nextPutAll: ((thisContext stack copy at: 12) tempsAndValues ) asString; cr."
	thisContext stack copy withIndexDo: [:stck :i |
		[rep nextPutAll: i asString; space; nextPutAll: stck asString; cr] ifError: [:er | rep nextPutAll: er asString; cr]].
	rep close. 
	Smalltalk exitFailure.]
  
! 

