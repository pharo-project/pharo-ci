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

"fix kernelPackageNames"

'From Pharo2.0a of ''18 April 2012'' [Latest update: #20245] on 7 August 2012 at 11:00:18 am'!

!SmalltalkImage methodsFor: 'PharoKernel' stamp: 'PavelKrivanek 8/7/2012 11:00'!
kernelPackageNames

  ^ #('Announcements-Core' 'Announcements-Core' 'Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed'
 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 
'Collections-Strings' 'Collections-Support' 'Collections-Text' 'Collections-Traits' 'Collections-Unordered' 
'Collections-Weak' 'Compiler' 'Compression' 'Files' 'Graphics-Display Objects' 'Graphics-Primitives' 
'Graphics-Transformations' 'Kernel' 'Multilingual-Encodings' 'Multilingual-ImmPlugin' 'Multilingual-Languages' 
'Multilingual-TextConversion'  'System-Change Notification' 'System-Changes' 'System-CommandLine' 'System-Clipboard' 
'System-FileRegistry' 'System-Finalization' 'System-Localization' 'System-Object Events' 'System-Platforms' 
'System-Support' 'Text-Core' 'Traits' 'UIManager' 'Transcript' 'FileSystem-AnsiStreams' 'FileSystem-Core' 
'FileSystem-Disk' 'FileSystem-Memory' 'CodeImport' 'Regex-Core' 'SystemProgress' 'System-Announcements'  'Ring-Core-Kernel')! !


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



Smalltalk shrinkToKernel.
