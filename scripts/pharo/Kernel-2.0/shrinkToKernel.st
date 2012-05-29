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
