'From Pharo1.4a of ''16 June 2011'' [Latest update: #14423] on 11 April 2012 at 2:38:47 pm'!

!PackageInfo methodsFor: 'listing' stamp: 'PavelKrivanek 4/17/2012 19:40'!
extensionMethods
  ^ (Smalltalk allClassesAndTraits, (Smalltalk allClasses collect: [:c | c class])) gather: [:classOrTrait | self extensionMethodsForClass: classOrTrait]! !


ZnConnectionTimeout value: 300 during: [
#(  'Fuel'
  'FuelMetalevel'
  'FuelPackageLoader'
) do: [:packageName |
  FileStream forceNewFileNamed: (packageName, '.st') do: [:file |
    file nextPutAll: (ScriptLoader latestSource: packageName location: 'http://ss3.gemstone.com/ss/Fuel')]].
].

!

FileStream readOnlyFileNamed: 'Fuel.st' do: [:file | file fileInSilently ].
FileStream readOnlyFileNamed: 'FuelMetalevel.st' do: [:file | file fileInSilently ].
FileStream readOnlyFileNamed: 'FuelPackageLoader.st' do: [:file | file fileInSilently ].
!

'From Pharo1.4a of ''16 June 2011'' [Latest update: #14424] on 18 April 2012 at 8:09:19 pm'!

!FLPackageLoaderGeneralMapper methodsFor: 'visiting' stamp: 'PavelKrivanek 4/18/2012 20:09'!
visitMetaclass: aMetaclass

    (Smalltalk globals includes: aMetaclass theNonMetaClass)
               ifTrue: [ self visitSubstitution: aMetaclass by: ((self clusterKeyedByClusterName: FLClassCluster) objects detect: [:each | each name =  aMetaclass theNonMetaClass name]) class ]
               ifFalse: [ super visitMetaclass: aMetaclass ]! !

'From Pharo1.4a of ''16 June 2011'' [Latest update: #14433] on 18 April 2012 at 9:26:39 pm'!

!FLFullGeneralMapper methodsFor: 'visiting' stamp: 'PavelKrivanek 4/18/2012 21:26'!
visitCompiledMethod: aCompiledMethod

  (self
    clusterKeyedByClusterName: FLCompiledMethodCluster 
    factory: [ FLCompiledMethodCluster withSourceCode ])
    add: aCompiledMethod traceWith: analysis! !




| packageNames |

FLSerializer serialize: (TextStyle named: 'Bitmap DejaVu Sans') toFileNamed: 'dejavu.fuel'.
FLSerializer serialize: (Unicode classPool at: #DecimalProperty) toFileNamed: 'decimalProperty.fuel'.
FLSerializer serialize: (Unicode classPool at: #GeneralCategory) toFileNamed: 'generalCategory.fuel'.
FLSerializer serialize: (UCSTable classPool at: #GB2312Table) toFileNamed: 'gb2312Table.fuel'.
FLSerializer serialize: (UCSTable classPool at: #JISX0208Table) toFileNamed: '#jisX0208Table.fuel'.
FLSerializer serialize: (UCSTable classPool at: #KSX1001Table) toFileNamed: '#ksx1001Table.fuel'.


packageNames := 'Ring-Core-Containers
Ring-Core-Kernel' lines.

FileStream forceNewFileNamed: 'ring.fuel' do: [:aStream |
       aStream binary.
       FLPackageStore new storeOn: aStream packages: packageNames.].

packageNames := #( 'Network-Kernel' 
  'Network-MIME' 
  'Network-UUID' 
  'Network-Url' 
  'Network-URI' 
  'Network-Protocols'
  'PackageInfo' 
  'System-FileRegistry' 
  'System-Announcements'
  'Monticello' 
  'MonticelloConfigurations' 
  'Zinc-HTTP' 
  'Zinc-Patch-HTTPSocket' 
  'Settings-Network'
  'Settings-Monticello'
  'Gofer-Core').

FileStream forceNewFileNamed: 'gofer.fuel' do: [:aStream |
       aStream binary.
       FLPackageStore new storeOn: aStream packages: packageNames.].

packageNames := 'Announcements-View
Announcements-Help
Announcements-Tests-Core
Balloon
BalloonTests
Collections-Arithmetic
Collections-Native
Collections-Traits
CollectionsTests
Compatibility
CompilerTests
CompressionTests
Deprecated14
EmergencyEvaluator
EventModel
FileSystem-AnsiStreams
FileSystem-Core
FileSystem-Disk
FileSystem-Memory
FileSystem-Tests-AnsiStreams
FileSystem-Tests-Core
FileSystem-Tests-Disk
FileSystem-Tests-Memory
FileSystem-Zip
FixUnderscores
FreeType
FreeTypeTests
Gofer-Tests
Graphics-External
Graphics-Files
Graphics-Fonts
Graphics-Resources
Graphics-Support
Graphics-Tests
Graphics-Text
HelpSystem-Core
HelpSystem-Tests
HostMenus
KernelTests
NECompletion
NOCompletion
MenuRegistration
MonticelloConfigurations
MonticelloGUI
MonticelloMocks
Morphic
MorphicTests
Multilingual-Tests
Network-Mail
Network-RFC822
Network-RemoteDirectory
NetworkTests
NonInteractiveTranscript
Polymorph-EventEnhancements
Polymorph-Geometry
Polymorph-TaskbarIcons
Polymorph-Tools-Diff
Polymorph-Widgets
RecentSubmissions
Regex-Core
Regex-Help
Regex-Tests-Core
Ring-Tests-Containers
Ring-Tests-Kernel
SUnit-Core
SUnit-Help
SUnit-Tests
SUnit-UI
ScriptLoader14
Settings-Compiler
Settings-Display
Settings-FreeType
Settings-Graphics
Settings-Kernel
Settings-Monticello
Settings-Network
Settings-Polymorph
Settings-System
Settings-Tools
Shout
ShoutTests
StartupPreferences
System-Applications
System-Download
System-FilePackage
System-Hashing
System-History
System-Installers
System-Serial Port
System-Settings
System-Sound
System-Text
System-Tools
Tests
Tools
ToolsTest
TrueType
UI-Basic
Zinc-Tests' lines.

FileStream forceNewFileNamed: 'pharo-core.fuel' do: [:aStream |
       aStream binary.
       FLPackageStore new storeOn: aStream packages: packageNames.].

Smalltalk snapshot: false andQuit: true.
