(MCWorkingCopy forPackage: (MCPackage named: 'System')) unregister!
(MCWorkingCopy forPackage: (MCPackage named: 'Graphics')) unregister!

!

"fix kernelPackageNames"

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20245] on 7 August 2012 at 11:00:18 am'!

!SmalltalkImage methodsFor: 'PharoKernel' stamp: 'PavelKrivanek 8/7/2012 11:00'!
kernelPackageNames



  ^ #('Announcements-  Core' 'Announcements-Core' 'Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed'
 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 
'Collections-Strings' 'Collections-Support' 'Collections-Text' 'Collections-Traits' 'Collections-Unordered' 
'Collections-Weak' 'Compiler' 'Compression' 'Files' 'Graphics-Display Objects' 'Graphics-Primitives' 
'Graphics-Transformations' 'Kernel' 'Multilingual-Encodings' 'Multilingual-ImmPlugin' 'Multilingual-Languages' 
'Multilingual-TextConversion'  'System-Change Notification' 'System-Changes' 'System-CommandLine' 'System-Clipboard' 
'System-FileRegistry' 'System-Finalization' 'System-Localization' 'System-Object Events' 'System-Platforms' 
'System-Support' 'Text-Core' 'Traits' 'UIManager' 'Transcript' 'FileSystem-AnsiStreams' 'FileSystem-Core' 
'FileSystem-Disk' 'FileSystem-Memory' 'CodeImport' 'Regex-Core' 'SystemProgress' 'System-Announcements')! !

"output Version Number of stdout"
FileStream stdout 
    nextPutAll: '[version] ';
    nextPutAll: SystemVersion current major asString;
    nextPutAll: '.';
    nextPutAll: SystemVersion current minor asString;
    nextPutAll: ' #' ;
    nextPutAll: SystemVersion current highestUpdate asString;
    cr.


"load FuelCommandLineHandler"

FileStream stdout nextPutAll: 'Loading Fuel'; cr.

Gofer new
  squeaksource3: 'Fuel';
  package: 'Fuel';
  package: 'FuelCommandLineHandler';
  load.

"load Tanker"

FileStream stdout nextPutAll: 'Loading Tanker'; cr.

Gofer new
    url: 'http://smalltalkhub.com/mc/marianopeck/Tanker/main';
    package: 'Tanker';
    package: 'TankerPackagesSupport';
    package: 'TankerCommandLineHandler';
    load.
    
   
  !




!ScriptLoader methodsFor: 'cleaning' stamp: 'PavelKrivanek 9/23/2010 10:30'!
cleanUpAfterMorphicInitialization
  "self new cleanUpForRelease"

  Author fullName: 'Mr.Cleaner'.
  DebuggerMethodMap withAllSubclassesDo: [ :each | each voidMapCache ].
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


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20245] on 7 August 2012 at 11:39:24 am'!

!SmalltalkImage methodsFor: 'PharoKernel-private' stamp: 'PavelKrivanek 8/7/2012 11:39'!
privShrinkingProcessWith: additionalPackageNames

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

    SystemNavigation new removeAllButPackages: self kernelPackageNames, additionalPackageNames.

    Smalltalk flushClassNameCache.
    3 timesRepeat: [
      Smalltalk garbageCollect.
        Symbol compactSymbolTable.].

    Undeclared removeUnreferencedKeys.
    self privRecompileAll.
    
    self privCleanChangeSets.
    
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


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20245] on 7 August 2012 at 11:40:38 am'!

!SmalltalkImage methodsFor: 'PharoKernel' stamp: 'PavelKrivanek 8/7/2012 11:40'!
shrinkToKernelWith: additionalPackageNames

  "
  WARNING:  THIS METHOD WILL DESTROY YOUR IMAGE

  Use with cation and only on fresh Pharo images 
  "

  [ self privShrinkingProcessWith: additionalPackageNames ] forkAt: 40.

  Processor terminateActive.
  
! !


!ScriptLoader methodsFor: 'pharo-core' stamp: 'PavelKrivanek 9/23/2010 10:30'!
initializeMorphicFrom: aTAPackage

| dejavu prj world table |


#(#Behavior #ProcessorScheduler #SmalltalkImage #Delay #ByteString #ByteTextConverter #Categorizer #ChronologyConstants #Collection #CompiledMethod #Delay #DateAndTime #DefaultExternalDropHandler #EncodedCharSet #ExternalDropHandler #ExternalSemaphoreTable #Float #Halt #HashTableSizes #ISOLanguageDefinition #InstructionStream #Integer #LanguageEnvironment #Locale #Object #OSPlatform #ProcessSpecificVariable #SetElement #String #Symbol #EventSensorConstants #WeakFinalizationList #WeakArray #WeakAnnouncementSubscription #WideSymbol #DefaultCommandLineHandler #RxMatcher #RxParser #RxsPredicate #AsyncFile #FileLocator #FileHandle #DiskStore #FileStream #MultiByteFileStream #FLWellKnownObjectsCluster #FLLargeIdentityHashedCollection) do: [:each | (Smalltalk globals at: each) initialize] .


    #(RGFactory InternetConfiguration NetNameResolver Socket Base64MimeConverter 
    MIMEType UUIDGenerator URI HTTPSocket PackageInfo 
    FileServices SystemAnnouncer MCCacheRepository MCDirtyPackageInfo 
    MCEmptyPackageInfo MCMethodDefinition MCMockASubclass MCMockClassA 
    MCMockPackageInfo MCPackageManager MCVersionReader MCWorkingCopy 
    ZnByteEncoder ZnConstants ZnMimeType ZnNetworkingUtils ZnServer 
    ZnSingleThreadedServer) do: [:c | (Smalltalk globals at: c) initialize.].

dejavu := aTAPackage additionalObjectAt: #DejaVu. 

TextConstants TextSharedInformation at: #DefaultTextStyle put: dejavu.
TextConstants TextSharedInformation at: #'Bitmap DejaVu Sans' put: dejavu.
TextConstants TextSharedInformation at: #DefaultMultiStyle put: dejavu.
TextConstants TextSharedInformation at: #DefaultFixedTextStyle put: dejavu.

"Smalltalk allClasses 
  select: [:class | class sharedPools includes: TextConstants]
  thenDo: [:class | class compileAll. class class compileAll].
"

StrikeFontFixer initialize.
TextStyle initialize.

FileStream stdout nextPutAll: 'loading tables...' asString; lf.

Unicode classPool at: #DecimalProperty put: (aTAPackage additionalObjectAt: #DecimalProperty).
Unicode classPool at: #GeneralCategory put: (aTAPackage additionalObjectAt: #GeneralCategory).
UCSTable classPool at: #GB2312Table put: (aTAPackage additionalObjectAt: #GB2312Table).
UCSTable classPool at: #JISX0208Table put: (aTAPackage additionalObjectAt: #JISX0208Table).
UCSTable classPool at: #KSX1001Table put: (aTAPackage additionalObjectAt: #KSX1001Table).

FileStream stdout nextPutAll: 'finished' asString; lf.

ProgressBarMorph initialize.

BalloonBezierSimulation initialize.
BalloonEngineConstants initialize.
BalloonEngine initialize.
Browser initialize.
"CommandHistory initialize."
CornerRounder initialize.
CPUWatcher initialize.
Debugger initialize.
DigitalSignatureAlgorithm initialize.
DummySoundSystem initialize.
FileContentsBrowser initialize.
FileList initialize.
FixUnderscores initialize.
FreeTypeCacheConstants initialize.
FreeTypeCache initialize.
"FreeTypeFontProvider initialize."
FreeTypeSettings initialize.
FreeTypeSubPixelAntiAliasedGlyphRenderer initialize.
FT2Constants initialize.
FT2Handle initialize.
GIFReadWriter initialize.
HaloMorph initialize.
HandMorph initialize.
"HostSystemMenus initialize."
ChangeList initialize.
ChangeSorter initialize.
CharacterScanner initialize.
ImageMorph initialize.
JPEGHuffmanTable initialize.
JPEGReadStream initialize.
JPEGReadWriter initialize.
LogicalFont initialize.
LongTestCase initialize.
MailAddressTokenizer initialize.
MailComposition initialize.
MczInstaller initialize.
MD5NonPrimitive initialize.
MenuItemMorph initialize.
MenuMorph initialize.
"MidiPrimTester initialize."
Morph initialize.
MultiCharacterScanner initialize.
"ParagraphEditor initialize."
PNGReadWriter initialize.
PrettyPrinting initialize.
ProcessBrowser initialize.
RealEstateAgent initialize.
"RecentMessageSet initialize."
RxMatcher initialize.
RxParser initialize.
RxsPredicate initialize.
ScriptLoader initialize.
ScrollBar initialize.
SecureHashAlgorithm initialize.
"ServerDirectory initialize."
SHA1 initialize.
ShortIntegerArray initialize.
ShortRunArray initialize.
SimpleEditor initialize.
"StandardToolSet initialize."
StrikeFontFixer initialize.
SystemProgressMorph initialize.
SystemWindow initialize.
TestCase initialize.
TextContainer initialize.
TextDiffBuilder initialize.
"TextPrinter initialize."
ThemeIcons initialize.
ThumbnailMorph initialize.
TransferMorph initialize.
UITheme initialize.
VistaryThemeIcons initialize.
WorldState initialize.
ZnByteEncoder initialize.
ZnConstants initialize.
ZnMimeType initialize.
ZnNetworkingUtils initialize.
ZnServer initialize.
ZnSingleThreadedServer initialize.
RGFactory initialize.

Cursor initTarget.
Cursor initialize.

MCDataStream initialize.

BalloonMorph setBalloonColorTo: Color yellow.

"prj := Project new.
Project classPool at: #CurrentProject put: prj.
"
world := PasteUpMorph new.

"prj instVarNamed: #world put: world."
world instVarNamed: #worldState put: WorldState new.

world world addHand: HandMorph new.
world activeHand.

Smalltalk at: #World put: world.
Smalltalk at: #ActiveWorld put: world.
Smalltalk at: #ActiveHand put: world activeHand.
Smalltalk at: #ActiveEvent put: nil.

world viewBox: Display boundingBox.
Sensor flushAllButDandDEvents.
world world handsDo: [:h | h initForEvents].
world borderWidth: 0.

MorphicUIManager new spawnNewProcess.

SystemWindow noteTopWindowIn: world.

Display newDepth: 32.
world displayWorldSafely.

UIManager default: MorphicUIManager new.

world displayWorldSafely.

UIManager default uiProcess resume.

"-----------------MorphicTextEditor register: PluggableTextMorph."

"(Delay forSeconds: 5) wait."


"this classes need world to resetWorldMenu"

DiskStore initialize.
FileHandle initialize.

"HelpBrowser initialize."
"HostWindowProxy initialize."
TaskbarMorph initialize.
TextEditor initialize.

"
Gofer it
  squeaksource: 'DejaVu';
  package: 'DejaVuBitmapFonts';
  load.
(Smalltalk globals at: #DejaVuHolder) installFull.
StandardFonts restoreDefaultFonts.
"

PharoTheme beCurrent.


TestRunnerBrowser register: TestRunner.

(world windowsSatisfying: [:w | w model canDiscardEdits]) do: [:w | w delete].


ScriptLoader new cleanUpAfterMorphicInitialization.


Display newDepth: 32.

(world instVarNamed: #worldState) canvas: nil.
SmalltalkEditor initialize.

FreeTypeFontProvider initialize.

SHPreferences initialize.
GraphicFontSettings setFontsToStyleNamed: #small.
"CombinedChar loadCompositionMapping."

AbstractFont initialize.
DialogItemsChooserUI initialize.
EditorFindReplaceDialogWindow initialize.
FinderUI initialize.
"HelpBrowser initialize."
PoolDefiner initialize.
PoolDefiner2 initialize.
RecentMessageList initialize.
SHTextStylerST80 initialize.

(Smalltalk at: #ActiveHand) instVarNamed: #targetOffset put: 0@0.


"---------LogoImageMorph installDesktopLogo."

PolymorphSystemSettings showDesktopLogo: false.
PolymorphSystemSettings showDesktopLogo: true.
PolymorphSystemSettings desktopColor: Color white.


NOCCompletionTable initialize.
NOCController initialize.
NECController initialize.
NECPreferences initialize.
NECTestSuperClass initialize.
NECTestClass initialize.

Smalltalk cleanOutUndeclared.

AbstractNautilusUI initialize.
BalloonMorph initialize.
DefaultCommandLineHandler initialize.
DefaultExternalDropHandler initialize.
IdentityTransform initialize.
KMPragmaKeymapBuilder initialize.
MCMockRPackage initialize.
MetacelloScriptLoader initialize.
Nautilus initialize.
NautilusIcons initialize.
NautilusMCBindings initialize.
RBAbstractClass initialize.
RBClass initialize.
RBConfigurableFormatter initialize.
RBMacSpellChecker initialize.
RBPharoPlatform initialize.
RBRefactoring initialize.
RBRefactoryChangeManager initialize.
RBScanner initialize.
RBSpellChecker initialize.
RBTransformationRule initialize.
RPackage initialize.
RPackageOrganizer initialize.
SpecBinder initialize.
StartupLoader initialize.

IconicButton initialize.

(aTAPackage additionalObjectAt: #PackageNames) do: [:name | PackageOrganizer default registerPackageNamed: name].
RPackageOrganizer fillUp.

SmalltalkImage current snapshot: true andQuit: false.
SmalltalkImage current snapshot: true andQuit: true.


UIManager default restoreDisplay.


! !


!SmalltalkImage methodsFor: 'PharoCore' stamp: 'PavelKrivanek 5/16/2012 19:51'!
exportCoreAsFuelPackage

| packageNames package additionalPackages |

FileStream forceNewFileNamed: 'pharo.tank' do: [:aStream |
  aStream binary.

  additionalPackages := #('Fuel' 'FuelMetalevel' 'FuelPackageLoader' 'FuelCommandLineHandler' 'Tanker' 'TankerCommandLineHandler' ).

  packageNames := ((MCWorkingCopy allManagers  collect: [:p | p package name] ) 
    copyWithoutAll: SmalltalkImage current kernelPackageNames, additionalPackages) asSortedCollection.

  package := TAPackage fromPackagesInfoNames: packageNames.
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



StandardFileStream stdout 
	nextPutAll: 'Time to export ', packageNames size asString, ' packages and a total of ', package behaviors size asString, ' classes: ' ;
	nextPutAll: [TAPackageStore new storePackage: package on: aStream] timeToRun asString, ' ms.'; lf.

].
! !

Smalltalk image exportCoreAsFuelPackage.

Smalltalk snapshot: false andQuit: true.
