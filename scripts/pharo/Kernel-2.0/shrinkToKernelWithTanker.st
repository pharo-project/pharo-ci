'From Pharo2.0a of ''18 April 2012'' [Latest update: #20440] on 20 December 2012 at 12:31:12 pm'!

!Author methodsFor: 'accessing' stamp: 'PavelKrivanek 12/20/2012 12:31'!
fullName: aString
  fullName := aString.
! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20444] on 20 December 2012 at 12:25:10 pm'!

!SmalltalkImage methodsFor: 'private' stamp: 'PavelKrivanek 12/20/2012 12:25'!
privSaveImageWithCleanup

  " Do not use this method for common image saving. This method is designated for saving the image during the shrinking process in headless images."

  | report |

  (Delay forMilliseconds: 1000) wait.

  Processor yield.

 13 "a magic number (Camillo) "timesRepeat: [ Smalltalk garbageCollect ].
 
  [
    self snapshot: true andQuit: true.
  ] ifError: [:e |
    | rep |
    rep := FileStream forceNewFileNamed: 'PharoDebug.log'.
    rep nextPutAll: 'PharoKernel shrinking report'; cr.
    rep nextPutAll: 'Error:'; cr.
    rep nextPutAll: e asString; cr.
    rep nextPutAll: thisContext stack size asString.
    thisContext stack copy withIndexDo: [:stck :i |
    [ rep nextPutAll: i asString; space; nextPutAll: stck asString; cr] ifError: []].
    rep close. 
    Smalltalk exitFailure ]! !



" hacks "


 Parser warningAllowed: true.   

" To be added soon in Pharo " 
" 'BufferedConverterBatchMethods.cs' asFileReference readStream fileIn."


"load FuelCommandLineHandler"

FileStream stdout nextPutAll: 'Loading Fuel'; cr.

Gofer new
      squeaksource3: 'Fuel';
  package: 'Fuel';
  package: 'FuelCommandLineHandler';
  load.

" Load and install new classbuilder  "
  Gofer it
                squeaksource3: 'PharoTaskForces';
                package: 'Slot';
                load.
        (Smalltalk at: #SlotVirus) perform: #spread.

  Gofer it
      squeaksource3: 'PharoTaskForces';
                package: 'SlotsClassBuilderIntegration';
                load.
                
                
"load Tanker"

FileStream stdout nextPutAll: 'Loading Tanker'; cr.

Gofer new
        smalltalkhubUser: 'marianopeck' project: 'Tanker';
    package: 'Tanker';
    package: 'TankerPackagesSupport';
    package: 'TankerCommandLineHandler';
    load.
       
!


!TAImport methodsFor: 'private' stamp: 'PavelKrivanek 11/25/2011 14:33'!
run

	| bundle |
	StandardFileStream stdout nextPutAll: 'Time to install sources in .changes: ', [sources run] timeToRun asString; lf.
	
	StandardFileStream stdout nextPutAll: 'Time to materialize: ',  [bundle := (FLMaterializer newDefault materializeFrom: binariesStream) root] timeToRun asString; lf.
	bundle installUsing: sources binaryStream: binariesStream.
	^ bundle
! !	


!TAExport methodsFor: 'private' stamp: 'PavelKrivanek 11/25/2011 14:33'!
run

	| bundle traits classes traitDefinitions classDefinitions extensionMethodDefinitions serializer extras |

	StandardFileStream stdout nextPutAll: 'Time to export sources and create definitions: ',
	[traits := self traitsOrder: (behaviors select: [:each | each isTrait ]).
	classes := self classesOrder: (behaviors select: [:each | each isBehavior ]).

	traitDefinitions := traits collect: [ :each | each tankerDefinitionOn: sourcesWriter ] as: Array.
	classDefinitions := classes collect: [ :each | each tankerDefinitionOn: sourcesWriter ] as: Array.
	extensionMethodDefinitions := methods collect: [ :each | each tankerDefinitionOn: sourcesWriter ] as: Array.

	self writeClassInitialization: classes. 
	sourcesWriter finalizeSourceWritting.	
] timeToRun asString; lf.
	
	StandardFileStream stdout nextPutAll: 'Time to serialize: ',
	[bundle := (TADefinitionBundle 
		classes: classDefinitions 
		traits: traitDefinitions 
		methods: extensionMethodDefinitions)
		mustInitialize: initializeClasses;
		yourself.
		
	serializer := FLSerializer newDefault.
	serializer header preMaterializationActions: preMaterializationActions. 
	serializer header postMaterializationActions: postMaterializationActions. 
	serializer serialize: bundle on: binariesStream.
	
	serializer serialize: preLoadActions on: binariesStream.
	serializer serialize: additionalObjects on: binariesStream.
	serializer serialize: postLoadActions on: binariesStream.
	
	binariesStream flush.
	sourcesStream flush.] timeToRun asString; lf.
! !	


!TADefinitionBundle methodsFor: 'private' stamp: 'PavelKrivanek 11/25/2011 14:33'!
installUsing: sources binaryStream: binaryStream environment: anEnvironment
	"Install the definitions in the received environment"

StandardFileStream stdout nextPutAll: 'Time to install classes in the system: ', 	
[	self readAndExecutePreLoadActionsFrom: binaryStream.
	
	traitDefinitions do: [ :each | 
		each installUsing: sources environment: anEnvironment ].

	classes := classDefinitions collect: [ :each | 
		each installUsing: sources environment: anEnvironment ].

	extensionMethodDefinitions do: [ :each | 
		each installUsing: sources environment: anEnvironment ].
	
	self initializeClassesIfNeeded. 
	] timeToRun asString; lf.
	self readAndStoreAdditionalObjectsFrom: binaryStream.
	self readAndExecutePostLoadActionsFrom: binaryStream.
! !	


!ScriptLoader methodsFor: 'cleaning' stamp: 'PavelKrivanek 9/23/2010 10:30'!
cleanUpAfterMorphicInitialization
  "self new cleanUpForRelease"

  Author fullName: 'Mr.Cleaner'.
"  DebuggerMethodMap withAllSubclassesDo: [ :each | each voidMapCache ]."
" self cleanUpPackageOrganizer.
  self cleanUpMethods.
" MCDataStream initialize.
  GradientFillStyle initPixelRampCache.
  FreeTypeCache clearCurrent.
  ImageMorph classPool at: #DefaultForm put: (Form extent: 1 @ 1 depth: 1).
  Behavior flushObsoleteSubclasses.
  MethodChangeRecord allInstancesDo: [ :x | x noteNewMethod: nil ].
  World cleanseOtherworldlySteppers.
  Smalltalk organization removeEmptyCategories.
  Browser initialize.
  SystemBrowser removeObsolete.
  AppRegistry removeObsolete.
  FileServices removeObsolete.
  MCFileBasedRepository flushAllCaches.
  MCMethodDefinition shutDown. 
  MCDefinition clearInstances.
  ExternalDropHandler resetRegisteredHandlers.
  Undeclared removeUnreferencedKeys.
  Smalltalk globals flushClassNameCache.
  ScrollBar initializeImagesCache.
  FreeTypeFontProvider current initialize.
  NaturalLanguageTranslator classPool at: #AllKnownPhrases put: nil.
  FreeTypeFontProvider current initialize.
" SystemNavigation default
    allObjectsDo: [ :each | 
      (each respondsTo: #releaseCachedState)
        ifTrue: [ each releaseCachedState ] ].
" 3 timesRepeat: [ 
    Smalltalk garbageCollect.
    Symbol compactSymbolTable ].
  HashedCollection rehashAll.
  
  "Remove empty categories, which are not in MC packages, because MC does
  not do this (this script does not make packages dirty)"
  Smalltalk organization removeEmptyCategories.
  Smalltalk
    allClassesAndTraitsDo: [ :class |
      [ :each |
        each
          removeEmptyCategories;
          sortCategories ]
            value: class organization;
            value: class class organization ].
" PackageOrganizer default packages
    do: [ :each | each methods ifEmpty: [ PackageOrganizer default unregisterPackage: each ] ]
    displayingProgress: 'Cleaning Packages'.
" Smalltalk organization sortCategories.
 ChangeSet removeChangeSetsNamedSuchThat: [ :each | true ].
  ChangeSet resetCurrentToNewUnnamedChangeSet.
  Smalltalk garbageCollect.
  Author reset! !



!SmalltalkImage methodsFor: 'PharoCore' stamp: 'PavelKrivanek 5/16/2012 19:51'!
exportCoreAsFuelPackage

| packageNames package additionalPackages behaviors methods export aBinaryStream aSourcesStream  |


  additionalPackages := #('Fuel' 'FuelMetalevel' 'FuelPackageLoader' 'FuelCommandLineHandler' 'Tanker' 'TankerCommandLineHandler' 'Slot').

  packageNames := ((MCWorkingCopy allManagers  collect: [:p | p package name] ) 
    copyWithoutAll: SmalltalkImage current kernelPackageNames, additionalPackages) asSortedCollection.

aBinaryStream := 'pharo.tank' asFileReference writeStream binary.
aSourcesStream := 'pharo.tankst' asFileReference writeStream.
behaviors := OrderedCollection new.
methods := OrderedCollection new.
packageNames do: [:packageName |
	behaviors addAll: ((PackageInfo named: packageName) classes).
	methods addAll: ((PackageInfo named: packageName) extensionMethods collect: [:each | each method])
	].


package := (TAPackage behaviors: behaviors extensionMethods: methods).
package mustInitialize: false.

  package addPostLoadAction: [:pkg | (Smalltalk at: #ScriptLoader) new initializeMorphicFrom: pkg].
  package addPreMaterializationAction: [
    #(World ActiveEvent ActiveWorld ActiveHand) do: [:className | Smalltalk globals at: className put: nil]. 
 ].

  package at: #PackageNames putAdditionalObject: (MCWorkingCopy allManagers  collect: [:p | p package name]).
  package at: #MCRegistry putAdditionalObject: (MCWorkingCopy registry).

  package at: #DejaVu putAdditionalObject: (TextStyle named: 'Bitmap DejaVu Sans').
  package at: #DecimalProperty putAdditionalObject: (Unicode classPool at: #DecimalProperty).
  package at: #GeneralCategory putAdditionalObject: (Unicode classPool at: #GeneralCategory).
  package at: #GB2312Table putAdditionalObject: (UCSTable classPool at: #GB2312Table).
  package at: #JISX0208Table putAdditionalObject: (UCSTable classPool at: #JISX0208Table).
  package at: #KSX1001Table putAdditionalObject: (UCSTable classPool at: #KSX1001Table).

export := TAExport  
	package: package
	binariesOn: aBinaryStream 
	sourcesOn: aSourcesStream.

StandardFileStream stdout 
	nextPutAll: 'Exporting ', packageNames size asString, ' packages and a total of ', behaviors size asString, ' classes '; lf.
	
export run.

aBinaryStream close.
aSourcesStream close.

! !

Smalltalk shrinkToKernelWith: #('Fuel' 'FuelMetalevel' 'FuelCommandLineHandler' 'Tanker' 'TankerCommandLineHandler' 'Slot' ).