"Load the typed pharo kernel ..."

CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: ProtoObject) forClass: ProtoObject.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: Object) forClass: Object.
CompilerFrontend registerCompilerContext: (OTCSupport defaultCompilerContextForClass: TUndefinedObject) forClass: TUndefinedObject.
TypeConfiguration uniqueInstance bootstrap: true.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/loadtypedfiles.st') fileIn.
TypeConfiguration uniqueInstance bootstrap: false.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/loadtypedfiles.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/loadtypedfiles.st') fileIn. "We need to check two times"
