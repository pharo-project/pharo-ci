TypeConfiguration uniqueInstance enableInstrumentation: true.
TypeConfiguration uniqueInstance enableCasts: false.

"Load the typed pharo kernel ..."

TypeConfiguration uniqueInstance disable: true.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: ProtoObject.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: Object.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: TUndefinedObject.

"Load fixes"
((FileDirectory on: ((FileDirectory default fullName),'/../scripts/Typesystem/Source-TypedKernel/Fixes')) matchingEntries: '*.st') do: [:each | each  readStream fileIn].

(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn.


TypeConfiguration uniqueInstance disable: false.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: ProtoObject) forClass: ProtoObject.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: Object) forClass: Object.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: TUndefinedObject) forClass: TUndefinedObject.

(FileStream oldFileNamed: '../scripts/Typesystem/Source-TypedKernel/global.st') fileIn.
(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn.
(FileStream oldFileNamed: '../scripts/Typesystem/Source-TypedKernel/fix-String.st') fileIn.
"(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn." "We need to check two times. Update: Not anymore"

TypeConfiguration uniqueInstance enableInstrumentation: true.
(FileStream oldFileNamed: '../scripts/Typesystem/loadfiles.st') fileIn.
TypeConfiguration uniqueInstance enableCasts: true.
