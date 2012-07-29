
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

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20236] on 29 July 2012 at 2:31:49 pm'!

!SmalltalkImage methodsFor: 'PharoKernel-private' stamp: 'PavelKrivanek 7/29/2012 14:31'!
privShrinkingProcess

  [
    | packages |
        
    10 timesRepeat: [
      (Delay forMilliseconds: 100) wait.
      Processor yield ].

    Author fullName: 'Mr.Shrinker'.

    self privCleanMonticello.

    UIManager default: DummyUIManager new.
    UIManager default progressBarEnabled: false.

    self privCleanProcesses.
    self privCleanGlobals.

    5 timesRepeat: [Smalltalk garbageCollect].

    MCDataStream initialize.

    Beeper instVarNamed: #default put: nil.

    Smalltalk cleanOutUndeclared.

    5 timesRepeat: [Smalltalk garbageCollect].

    Author reset.
  
    KMPragmaKeymapBuilder release.

    self privShrinkUnicodeTables.

    Display newDepth: 1.

    self privCleanStartUpList.
    self privCleanShutDownList.

"    CommandLine removeRegistrationNamed: #BasicCodeLoader.
    SimpleCodeLoader register.
"
    "move class Model to different category"
    Object subclass: #Model instanceVariableNames: 'dependents' classVariableNames: '' poolDictionaries: '' category: 'Kernel-Objects'.

    self privCleanTextConstants.

    SoundService default: nil.
    SoundService unregister: DummySoundSystem.

    ThreadSafeTranscript install.

    self privCleanUnloadMethods.

    SystemNavigation new removeAllButPackages: self kernelPackageNames.

    Smalltalk flushClassNameCache.
    3 timesRepeat: [
      Smalltalk garbageCollect.
        Symbol compactSymbolTable.].

    Undeclared removeUnreferencedKeys.
    self privRecompileAll.
    
    self privCleanChangeSets.
    
    SystemEventManager allInstances do: [:i | i instVarNamed: #actionMap put: IdentityDictionary new].

    FileServices removeObsolete.
    DebuggerMethodMap voidMapCache.

    Object flushEvents.

    MCDataStream initialize.

    Locale classPool at: #LocaleChangeListeners put: nil.
    SmalltalkImage classPool at: #Tools put: nil.

    Behavior flushObsoleteSubclasses.
    Smalltalk flushClassNameCache.
    Smalltalk organization removeEmptyCategories.

    WeakArray restartFinalizationProcess.

    "UIManager default progressBarEnabled: true."
    "Smalltalk condenseChanges."

    Smalltalk saveImageInNewContext.

  ] ifError: [:e |
    | rep |
    FLSerializer newFull serialize: thisContext toFileNamed: 'PharoDebug.fuel'.
    rep := FileStream forceNewFileNamed: 'PharoDebug.log'.
    rep nextPutAll: 'PharoKernel shrinking report'; cr.
    rep nextPutAll: 'Error:'; cr.
    rep nextPutAll: e asString; cr.
    rep nextPutAll: thisContext stack size asString.
    thisContext stack copy withIndexDo: [:stck :i |
    [ rep nextPutAll: i asString; space; nextPutAll: stck asString; cr] ifError: []].
    rep close. 
    Smalltalk exitFailure ] 



! !

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20236] on 29 July 2012 at 2:53:33 pm'!

!Class methodsFor: 'initialize-release' stamp: 'al 9/3/2004 13:35'!
removeFromSystem

  FileStream stdout nextPutAll: self name asString; lf.

	"Forget the receiver from the Smalltalk global dictionary. Any existing 
	instances will refer to an obsolete version of the receiver."
	self removeFromSystem: true.! !



Smalltalk shrinkToKernel.
