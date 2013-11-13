"Clear Author"
Author reset.
!
"Clear Monticello Caches"
MCCacheRepository instVarNamed: 'default' put: nil.
MCFileBasedRepository flushAllCaches.
MCMethodDefinition shutDown.
MCDefinition clearInstances.
!
"Cleanup Smalltalk"
Smalltalk flushClassNameCache.
Smalltalk organization removeEmptyCategories.
Smalltalk allClassesAndTraitsDo: [ :each |
	each organization removeEmptyCategories; sortCategories.
	each class organization removeEmptyCategories; sortCategories ].
!
"Cleanup System Memory"
Smalltalk garbageCollect.
Symbol compactSymbolTable.
!

"Try to delay saving the image, hoping that some pending tasks might be finished"
[ 
    "yield to other pending processes and suspend myself"
    Processor yield.
    "Save in the main UI thread, otherwise saving will create a broken image"
    WorldState addDeferredUIMessage: [
        SmalltalkImage current snapshot: true andQuit: true ].
] forkAt: Processor systemBackgroundPriority.
