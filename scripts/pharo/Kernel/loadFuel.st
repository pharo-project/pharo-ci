[ 

log := ((Smalltalk vm getSystemAttribute: 3) ifNil: [FileDirectory default] ifNotNilDo: [:path | FileDirectory on: path]) forceNewFileNamed: 'info_loadFuel.txt'.

packagesDir := ((Smalltalk vm getSystemAttribute: 4) ifNil: [FileDirectory default] ifNotNilDo: [:path | FileDirectory on: path]).

old := Undeclared copy.
oldCalls := SystemNavigation default allUnimplementedCalls.
lastCalls := oldCalls.

#(
  'Fuel' 
  'FuelPackageLoader'
  'FuelCodeLoader'
) do: [:package|
  log nextPutAll: 'loading ', package, '...'; cr.
  packagesDir readOnlyFileNamed: package, '.st' do: [:file | file fileInSilently ].
  log nextPutAll: package, ' loaded'; cr.
  log nextPutAll: 'New Undeclared:'; cr.
  log nextPutAll: (Undeclared copyWithoutAll: old) asString; cr.
  log nextPutAll: 'New unimplemented calls:'; cr.
  unimplemented := SystemNavigation default allUnimplementedCalls.
  log nextPutAll: (unimplemented copyWithoutAll: lastCalls) asString; cr.
  lastCalls := unimplemented.
  log nextPutAll: 'Unimplemented calls:'; cr.
  log nextPutAll: (unimplemented copyWithoutAll: oldCalls) asString; cr; cr.
].


SystemNavigation default removeAllButPackages: #("'Compiler'" 'Fuel' 'FuelPackageLoader' 'FuelCodeLoader' 'Announcements-Core' 'Collections-Abstract' 'Collections-Arithmetic' 'Collections-Arrayed' 'Collections-Atomic' 'Collections-Native' 'Collections-Sequenceable' 'Collections-Stack' 'Collections-Streams' 'Collections-Strings' 'Collections-Support' 'Collections-Text' 'Collections-Traits' 'Collections-Unordered' 'Collections-Weak' 'Compression' 'Files' 'Graphics-Display Objects' 'Graphics-Primitives' 'Graphics-Transformations' 'Kernel' 'Multilingual-Encodings' 'Multilingual-ImmPlugin' 'Multilingual-Languages' 'Multilingual-TextConversion' 'Ring-Core-Kernel'  'Ring-Core-Containers' 'System-BreakPoints' 'System-Change Notification' 'System-Changes' 'System-Clipboard' 'System-Debugging' 'System-FileRegistry' 'System-Finalization' 'System-Localization' 'System-Object Events' 'System-Object Storage' 'System-Platforms' 'System-Support' 'Traits' 'UIManager' 'Transcript').

CommandLine removeRegistrationNamed: #SimpleCodeLoader.
(Smalltalk globals at: #FuelCodeLoader) register.

"
FileStream readOnlyFileNamed: 'testingPackage.fuel' do: [:aStream | aStream binary.
FLPackageLoader new loadFrom: aStream contents readStream
].

FileStream readOnlyFileNamed: 'compiler.fuel' do: [:aStream | aStream binary.
FLPackageLoader new loadFrom: aStream contents readStream
].

log nextPutAll: (Smalltalk at: #TestingClass) hello.
"

log close.

SmalltalkImage current snapshot: true andQuit: true.

] ifError: [:e |
  | rep |
  rep := FileStream forceNewFileNamed: 'PharoDebug.log'.
  rep nextPutAll: 'loadFuel.st'; cr.
  rep nextPutAll: 'Error:'; cr.
  rep nextPutAll: e asString; cr.
  rep nextPutAll: thisContext stack size asString; cr.
" rep nextPutAll: ((thisContext stack copy at: 12) tempsAndValues ) asString; cr."
  thisContext stack copy withIndexDo: [:stck :i |
    [rep nextPutAll: i asString; space; nextPutAll: stck asString; cr] ifError: [:er | rep nextPutAll: er asString; cr]].
  rep close. 
  Smalltalk quitPrimitive.]
  
! 