'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 24 June 2012 at 9:53:48 pm'!

!CompiledMethod methodsFor: 'private' stamp: 'MarcusDenker 4/29/2012 10:33'!
getSourceReplacingSelectorWith: newSelector
  | oldKeywords newKeywords args newSelectorWithArgs source oldSelector s |
  source := self sourceCode.
  oldSelector := self parserClass new parseSelector: source.
  oldSelector = newSelector ifTrue: [ ^ source ].
  oldKeywords := oldSelector keywords.
  newKeywords := (newSelector ifNil: [self defaultSelector]) keywords.
  [oldKeywords size = newKeywords size] assert.
  args := (self methodClass parserClass new
    parseArgsAndTemps: source string notifying: nil) copyFrom: 1 to: self numArgs.
  newSelectorWithArgs := String streamContents: [:stream |
    newKeywords withIndexDo: [:keyword :index |
      stream nextPutAll: keyword.
      stream space.
      args size >= index ifTrue: [
        stream nextPutAll: (args at: index); space]]].
  s := source string readStream.
  oldKeywords do: [ :each | s match: each ].
  args isEmpty ifFalse: [ s match: args last ].
  ^newSelectorWithArgs trimBoth, s upToEnd! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 26 June 2012 at 10:25:45 am'!

!TPureBehavior methodsFor: 'traits' stamp: 'PavelKrivanek 6/26/2012 10:25'!
traitsProvidingSelector: aSymbol
  | result |
  result := OrderedCollection new.
  self hasTraitComposition ifFalse: [^result].
  (self traitComposition methodDescriptionsForSelector: aSymbol)
    do: [:methodDescription | methodDescription selector = aSymbol ifTrue: [
      result addAll: (methodDescription locatedMethods
        collect: [:each | each methodClass])]].
  ^result! !

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 26 June 2012 at 10:24:51 am'!

!TraitComposition methodsFor: 'enquiries' stamp: 'PavelKrivanek 6/26/2012 10:24'!
traitProvidingSelector: aSymbol
  "Return the trait which originally provides the method aSymbol or return nil
  if trait composition does not provide this selector or there is a conflict.
  Take aliases into account. Return the trait which the aliased method is defined in."

  | methodDescription locatedMethod |
  methodDescription := self methodDescriptionForSelector: aSymbol.
  (methodDescription isProvided not or: [methodDescription isConflict]) 
    ifTrue: [^nil].
  locatedMethod := methodDescription providedLocatedMethod.
  ^locatedMethod methodClass traitOrClassOfSelector: locatedMethod selector! !



'From Pharo1.4a of ''16 June 2011'' [Latest update: #14385] on 9 March 2012 at 8:50:12 pm'!
Parser subclass: #MockCustomParser
  instanceVariableNames: ''
  classVariableNames: ''
  poolDictionaries: ''
  category: 'CompilerTests'!


| log packagesDir|

[	

packagesDir := ((Smalltalk vm getSystemAttribute: 4) ifNil: [FileSystem disk workingDirectory] ifNotNilDo: [:path | FileSystem disk workingDirectory resolve: path]).

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


packagesDir readOnlyFileNamed: packageName, '.st' do: [:file | CodeImporter evaluateReadStream: file ].
FileStream stdout nextPutAll: packageName, ' loaded'; lf.].

FileStream stdout nextPutAll: 'Load tests finished'; lf.

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
	Smalltalk quitFailure.]
  
! 