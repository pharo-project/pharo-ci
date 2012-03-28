"Load the typed pharo kernel ..."

TypeConfiguration uniqueInstance bootstrap: true.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: ProtoObject.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: Object.
CompilerFrontend registerCompilerContext: OTCSupport defaultCompilerContext forClass: TUndefinedObject.

(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn.


TypeConfiguration uniqueInstance bootstrap: false.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: ProtoObject) forClass: ProtoObject.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: Object) forClass: Object.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: TUndefinedObject) forClass: TUndefinedObject.

(FileStream oldFileNamed: '../scripts/Typesystem/Source-TypedKernel/global.st') fileIn.
(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn.
(FileStream oldFileNamed: '../scripts/Typesystem/loadtypedfiles.st') fileIn. "We need to check two times"

(FileStream oldFileNamed: '../scripts/Typesystem/loadfiles.st') fileIn.
