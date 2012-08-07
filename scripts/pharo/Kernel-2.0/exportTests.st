'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 26 June 2012 at 10:02:40 am'!

!Class methodsFor: 'fileIn/Out' stamp: 'PavelKrivanek 6/26/2012 10:02'!
shouldFileOutPools
  "respond with true if the user wants to file out the shared pools"
  ^ false! !


ZnConnectionTimeout value: 300 during: [
'Announcements-Tests-Core
CollectionsTests
CompilerTests
CompressionTests
FileSystem-Tests-AnsiStreams
FileSystem-Tests-Core
FileSystem-Tests-Disk
FileSystem-Tests-Memory
FuelMetalevelTests
FuelPackageLoaderTests
FuelTests
KernelTests
Multilingual-Tests
SUnit-Core
SUnit-Tests
Tests' linesDo: [:packageName |
  "((Smalltalk vm getSystemAttribute: 3) ifNil: [FileSystem disk workingDirectory] ifNotNilDo: [:path | FileSystem disk workingDirectory resolve: path])" 
 FileStream forceNewFileNamed: (packageName, '.st') do: [:file |
    file nextPutAll: (ScriptLoader latestSource: packageName location: 'http://ss3.gemstone.com/ss/Pharo20')]].

FooSharedPool fileOut.

'Tests-Bugs
Tests-CodeImport
Tests-Compression
Tests-Exceptions
Tests-Files
Tests-Finalization
Tests-Localization
Tests-Object Events
Tests-ObjectsAsMethods
Tests-Release
Tests-System
Tests-System-CommandLine
Tests-SystemChangeNotification
Tests-SystemTests-Support
Tests-Traits
Tests-Traits-MOP
Tests-VM' linesDo: [:categoryName | SystemOrganization fileOutCategory:  categoryName ].

#(
  'HudsonBuildTools'
) do: [:packageName |
  "((Smalltalk vm getSystemAttribute: 3) ifNil: [FileSystem disk workingDirectory] ifNotNilDo: [:path | FileSystem disk workingDirectory resolve: path])" 
 FileStream forceNewFileNamed: (packageName, '.st') do: [:file |
    file nextPutAll: (ScriptLoader latestSource: packageName location: 'http://source.lukas-renggli.ch/hudson')]].
]
!

SmalltalkImage current snapshot: false andQuit: true.

FooSharedPool fileOut