'From Pharo3.0 of 18 March 2013 [Latest update: #30138] on 17 May 2013 at 10:51:52 am'!

!SmalltalkImage methodsFor: 'PharoKernel' stamp: 'PavelKrivanek 11/20/2012 20:07'!
kernelPackageNames
 
  ^ #('AST-Core' 'AST-Semantic' 'Announcements-Core' 'Announcements-Core' 'Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed'
 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 
'Collections-Strings' 'Collections-Support' 'Collections-Text' 'Collections-Traits' 'Collections-Unordered' 
'Collections-Weak' 'Compiler' 'Compression' 'Files' 'Graphics-Display Objects' 'Graphics-Primitives' 
'Graphics-Transformations' 'Kernel' 'Multilingual-Encodings' 'Multilingual-ImmPlugin' 'Multilingual-Languages' 
'Multilingual-TextConversion'  'System-Change Notification' 'System-Changes' 'System-CommandLine' 'System-Clipboard' 
'System-FileRegistry' 'System-Finalization' 'System-Localization' 'System-Object Events' 'System-Platforms' 
'System-Support' 'Text-Core' 'Traits' 'UIManager' 'Transcript' 'FileSystem-AnsiStreams' 'FileSystem-Core' 
'FileSystem-Disk' 'FileSystem-Memory' 'CodeImport' 'Regex-Core' 'SystemProgress' 'System-Announcements' 'Ring-Core-Kernel' 
'Ring-Core-Containers' 'Kernel-Pragmas' 'Kernel-Pragmas' 'System-PragmaCollector' 'OpalCompiler-Core')! !

'From Pharo3.0 of 18 March 2013 [Latest update: #30138] on 17 May 2013 at 11:11:51 am'!

!DefaultCommandLineHandler class methodsFor: 'class initialization' stamp: 'PavelKrivanek 5/17/2013 11:11'!
startUp: resuming

  "only handle when lauching a new image"
  resuming ifFalse: [ ^ self ].
  "Smalltalk tools userManager canRunStartupScript ifFalse: [ ^ self ]."
  Smalltalk addDeferredStartupAction: [ self new activate ]! !


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20580] on 8 March 2013 at 12:58:16 pm'!

!ClassDescription methodsFor: 'accessing method dictionary' stamp: 'PavelKrivanek 3/8/2013 12:58'!
addAndClassifySelector: selector withMethod: compiledMethod inProtocol: category notifying: requestor
  | priorMethodOrNil oldProtocol newProtocol |
  
  priorMethodOrNil := self compiledMethodAt: selector ifAbsent: [nil].
  
  self addSelectorSilently: selector withMethod: compiledMethod.
  
  oldProtocol := self organization categoryOfElement: selector.
  SystemAnnouncer uniqueInstance 
    suspendAllWhile: [ self organization classify: selector under: category ].
    
  newProtocol := self organization categoryOfElement: selector.
  priorMethodOrNil isNil
    ifTrue: [
      SystemAnnouncer uniqueInstance 
        methodAdded: compiledMethod 
        selector: selector 
        inProtocol: category 
        class: self 
        requestor: requestor]
    ifFalse: [
      "If protocol changed and someone is from different package, I need to throw a method recategorized"
      newProtocol = oldProtocol
        ifFalse: [ 
          | rpackage oldPackage newPackage |
              
          (Smalltalk hasClassNamed: #RPackage) ifTrue: [

            rpackage := Smalltalk classNamed: #RPackage.
            "Check for repackage"
            newPackage := rpackage organizer 
              packageForProtocol: newProtocol 
              inClass: self.
            oldPackage := rpackage organizer 
              packageForProtocol: oldProtocol 
              inClass: self.
            (newPackage = oldPackage)
              ifFalse: [ 
                SystemAnnouncer uniqueInstance 
                  methodRepackaged: compiledMethod 
                  from: oldPackage 
                  to: newPackage ]].
              
          "Announce recategorization"
          SystemAnnouncer uniqueInstance 
            selector: selector 
            recategorizedFrom: oldProtocol 
            to: newProtocol 
            inClass: self  ]. 
      
      SystemAnnouncer uniqueInstance 
        methodChangedFrom: priorMethodOrNil 
        to: compiledMethod 
        selector: selector 
        inClass: self 
        oldProtocol: oldProtocol 
        newProtocol: newProtocol 
        requestor: requestor.]. ! !


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


'From Pharo2.0a of ''18 April 2012'' [Latest update: #20407] on 19 November 2012 at 10:57:46 am'!

!SmalltalkImage methodsFor: 'PharoKernel-private' stamp: 'PavelKrivanek 11/19/2012 10:57'!
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

    (Smalltalk classNamed: #MCDataStream) initialize.

    Beeper instVarNamed: #default put: nil.

    Smalltalk cleanOutUndeclared.

    5 timesRepeat: [Smalltalk garbageCollect].

    Author reset.
  
    (Smalltalk classNamed: #KMPragmaKeymapBuilder) release.

    "self privShrinkUnicodeTables."

    Display newDepth: 1.

    self privCleanStartUpList.
    self privCleanShutDownList.

"    CommandLine removeRegistrationNamed: #BasicCodeLoader.
    SimpleCodeLoader register.
"
    "move class Model to different category"
    Object subclass: #Model instanceVariableNames: 'dependents' classVariableNames: '' poolDictionaries: '' category: 'Kernel-Objects'.

    self privCleanTextConstants.

    (Smalltalk classNamed: #SoundService) default: nil.
    (Smalltalk classNamed: #SoundService) unregister: (Smalltalk classNamed: #DummySoundSystem).

    ThreadSafeTranscript install.

    self privCleanUnloadMethods.

    (Smalltalk classNamed: #RPackageOrganizer) unregisterInterestToSystemAnnouncement.

    SystemNavigation new removeAllButPackages: self kernelPackageNames, additionalPackageNames.

    Smalltalk flushClassNameCache.
    3 timesRepeat: [
      Smalltalk garbageCollect.
        Symbol compactSymbolTable.].

    Undeclared removeUnreferencedKeys.
    self privRecompileAll.
    
    self privCleanChangeSets.
    
    FileServices removeObsolete.

    Object flushEvents.

    (Smalltalk classNamed: #MCDataStream) initialize.

    Locale classPool at: #LocaleChangeListeners put: nil.
    SmalltalkImage classPool at: #Tools put: nil.

    Behavior flushObsoleteSubclasses.
    Smalltalk flushClassNameCache.
    Smalltalk organization removeEmptyCategories.

    WeakArray restartFinalizationProcess.
    SmalltalkImage current fixObsoleteReferences.

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
    Smalltalk exitFailure ] ! !


Smalltalk shrinkToKernel.
