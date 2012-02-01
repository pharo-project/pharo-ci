"Load The TypeSystem..."
"see  http://pleiad.dcc.uchile.cl/private/gradual-types/installation"

"in Source directory"
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Errors.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeConfiguration.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/Type.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Core.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Types.st') fileIn.

"go to Extension directory"
((FileDirectory on: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/Extensions') matchingEntries: '*.st') do: [:each | each  readStream fileIn].
		
"go back to main dir"
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Rules.st') fileIn.	
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Analyzer.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Compiler.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Parser.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-Types-Support.st') fileIn.
(FileStream oldFileNamed: '/builds/jenkins/workspace/Gradual Typing/scripts/Typesystem/Source/TypeSystem-TempSupport.st') fileIn.

