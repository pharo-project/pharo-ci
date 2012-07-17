'From Pharo2.0a of ''18 April 2012'' [Latest update: #20216] on 17 July 2012 at 11:16:21 am'!

!SmalltalkImage methodsFor: 'PharoKernel' stamp: 'GuillermoPolito 6/21/2012 11:53'!
kernelPackageNames

  ^ #('Announcements-Core' 'Announcements-Core' 'Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed' 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 'Collections-Strings' 'Collections-Support' 'Collections-Text' 'Collections-Traits' 'Collections-Unordered' 'Collections-Weak' 'Compiler' 'Compression' 'Files' 'Graphics-Display Objects' 'Graphics-Primitives' 'Graphics-Transformations' 'Kernel' 'Multilingual-Encodings' 'Multilingual-ImmPlugin' 'Multilingual-Languages' 'Multilingual-TextConversion'  'System-Change Notification' 'System-Changes' 'System-CommandLine' 'System-Clipboard' 'System-FileRegistry' 'System-Finalization' 'System-Localization' 'System-Object Events' 'System-Platforms' 'System-Support' 'Text-Core' 'Traits' 'UIManager' 'Transcript' 'FileSystem-AnsiStreams' 'FileSystem-Core' 'FileSystem-Disk' 'FileSystem-Memory' 'Fuel' 'FuelMetalevel' 'FuelPackageLoader' 'CodeImport' 'FuelFileSystem' 'FuelCommandLineHandler' 'Regex-Core' 'SystemProgress' 'System-
Announcements')! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20216] on 17 July 2012 at 8:39:54 am'!

!SmalltalkImage methodsFor: 'PharoKernel-private' stamp: 'PavelKrivanek 7/17/2012 08:39'!
privCleanUnloadMethods

  " remove class unload methods to avoid their calling during removing of this classes "

  #(#Browser #ChangeList #ChangeSorter #DummySoundSystem #FT2Handle 
  #FileContentsBrowser #GZipReadStream #GZipWriteStream #MCVersionReader 
  #MailComposition #Morph #FreeTypeFontProvider
  #DefaultExternalDropHandler #FileStream #Form) 
    do: [:className | (Smalltalk at: className) class removeSelector: #unload. ].! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 24 June 2012 at 6:29:56 pm'!

!MessageSend methodsFor: 'evaluating' stamp: 'PavelKrivanek 6/24/2012 18:29'!
value: anObject

	(receiver class isObsolete) ifTrue: [^ nil].
	(receiver isBehavior and: [receiver isObsolete]) ifTrue: [^ nil].

	^ receiver 
		perform: selector 
		with: anObject! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 24 June 2012 at 6:29 pm'!

!MessageSend methodsFor: 'evaluating' stamp: 'PavelKrivanek 6/24/2012 18:28'!
value
	"Send the message and answer the return value"

	(receiver class isObsolete) ifTrue: [^ nil].
	(receiver isBehavior and: [receiver isObsolete]) ifTrue: [^ nil].

	arguments ifNil: [^ receiver perform: selector].

	^ receiver 
		perform: selector 
		withArguments: (self collectArguments: arguments)! !




'From Pharo2.0a of ''18 April 2012'' [Latest update: #20156] on 24 June 2012 at 2:07:37 pm'!

!SystemNavigation methodsFor: 'packages' stamp: 'GuillermoPolito 6/24/2012 14:07'!
removeAllButPackages: packagesList
  "Remove all classes and methods that do not belong to some of listed packages. Skip #unload. Do not use this method if you can use Monticello!! This method is used by some low-level shrinking process. Do not use it. This is quite hackish"

  | keep remove oldRemove extensionCategories log |
  keep := Set new.      
  packagesList do: [:pkg | keep addAll: (self allClassesInPackageNamed: pkg)].
  oldRemove := Set new.
  [ 
    remove := Smalltalk globals allClassesAndTraits reject: [:c | keep includes: c].
    remove := remove collect: [:c | c name].
    (remove asSortedCollection: [:a :b | a  <= b ]) do: [:className |
      | class |
      class := (Smalltalk globals classOrTraitNamed: className).
      class allSubclasses ifEmpty: [
        SystemChangeNotifier uniqueInstance noMoreNotificationsFor: class.
	  SystemAnnouncer unsubscribe: class.
        class isTrait ifFalse: [ 
          (class class includesSelector: #unload) ifTrue: [ class removeSelector: #unload ] ].
        class removeFromSystem. 
        ] ].

    
    oldRemove ifNotEmpty: [
      oldRemove = remove ifTrue: [          
         self error: 'Some classes still have subclasses: ', (remove collect: [:c | c -> (Smalltalk classOrTraitNamed: c) allSubclasses]) asString ] ].
    oldRemove := remove.
    remove notEmpty] whileTrue.

  keep do: [: class | 
    extensionCategories := (class organization ownCategories select: [:category | 
      category first = $*]) asOrderedCollection.
    extensionCategories removeAllSuchThat: [:category |
      packagesList anySatisfy: [:package |
        ((category asLowercase allButFirst = package asLowercase) or: [package asLowercase, '-*' match: category asLowercase allButFirst])]].
    extensionCategories do: [:category | 
      class removeCategory: category ]. 
    class isTrait ifFalse: [
      extensionCategories := (class class organization ownCategories select: [:category | 
        category first = $*]) asOrderedCollection.
      extensionCategories removeAllSuchThat: [:category |
        packagesList anySatisfy: [:package |
          ((category asLowercase allButFirst = package asLowercase) or: [package asLowercase, '-*' match: category asLowercase allButFirst])]].
      extensionCategories do: [:category | 
        class class removeCategory: category ]]].
      
! !




'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 24 June 2012 at 11:44:56 am'!

!WeakMessageSend methodsFor: 'private' stamp: 'PavelKrivanek 6/24/2012 11:44'!
ensureReceiver
	"Return true if my receiver hasn't gone away"
	self receiver ifNil: [^ false].
	(self receiver class isObsolete) ifTrue: [^ false].
	(self receiver isBehavior and: [self receiver isObsolete]) ifTrue: [^ false].
	^ true.
! !

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 24 June 2012 at 11:49:18 am'!

!WeakMessageSend methodsFor: 'private' stamp: 'PavelKrivanek 6/24/2012 11:48'!
ensureReceiverAndArguments

	"Return true if my receiver hasn't gone away"
	self receiver ifNil: [^ false].
	(self receiver class isObsolete) ifTrue: [^ false].
	(self receiver isBehavior and: [self receiver isObsolete]) ifTrue: [^ false].

	"Make sure that my arguments haven't gone away"
	arguments ifNotNil: [
		arguments with: shouldBeNil do: [ :arg :flag |
			arg ifNil: [ flag ifFalse: [ ^false ]]
		]
	].

	^true
! !


Object subclass: #PragmaCollector
  instanceVariableNames: 'announcer collected filter'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PragmaCollector'!

Announcement subclass: #PragmaCollectorReset
  instanceVariableNames: 'collector'
  classVariableNames: ''
  poolDictionaries: ''
  category: 'PragmaCollector'!

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20152] on 22 June 2012 at 11:35:37 am'!

!DummyUIManager methodsFor: 'ui requests' stamp: 'PavelKrivanek 6/22/2012 11:35'!
progressInitiationExceptionDefaultAction: anException

  | result |

  result := anException workBlock value: DummySystemProgressItem new.

  anException resume: result! !



"output Version Number of stdout"
FileStream stdout 
    nextPutAll: '[version] ';
    nextPutAll: SystemVersion current major asString;
    nextPutAll: '.';
    nextPutAll: SystemVersion current minor asString;
    nextPutAll: ' #' ;
    nextPutAll: SystemVersion current highestUpdate asString;
    cr.

!

!SmalltalkImage methodsFor: 'PharoCore' stamp: 'PavelKrivanek 5/16/2012 19:51'!
exortCoreAsFuelPackage

| packageNames package |

FileStream forceNewFileNamed: 'pharo-core.fuel' do: [:aStream |
  aStream binary.

  packageNames := ((MCWorkingCopy allManagers  collect: [:p | p package name] ) 
    copyWithoutAll: SmalltalkImage current kernelPackageNames) asSortedCollection.

  package := FLPackage withPackages: packageNames.
  package mustInitialize: false.
  package addPostLoadAction: [:pkg | ScriptLoader new initializeMorphicFrom: pkg].
  package packageHeader addPreMaterializationAction: [:header | 
    #(World ActiveEvent ActiveWorld ActiveHand) do: [:className | Smalltalk globals at: className put: nil]. 
    FileStream stdout nextPutAll: 'executed...'; lf. ].

  package at: #PackageNames putAdditionalObject: (MCWorkingCopy allManagers  collect: [:p | p package name]).
  package at: #MCRegistry putAdditionalObject: (MCWorkingCopy registry).

  package at: #DejaVu putAdditionalObject: (TextStyle named: 'Bitmap DejaVu Sans').
  package at: #DecimalProperty putAdditionalObject: (Unicode classPool at: #DecimalProperty).
  package at: #GeneralCategory putAdditionalObject: (Unicode classPool at: #GeneralCategory).
  package at: #GB2312Table putAdditionalObject: (UCSTable classPool at: #GB2312Table).
  package at: #JISX0208Table putAdditionalObject: (UCSTable classPool at: #JISX0208Table).
  package at: #KSX1001Table putAdditionalObject: (UCSTable classPool at: #KSX1001Table).

  FLPackageStore new storePackage: package on: aStream

].
! !

Smalltalk shrinkToKernel.
