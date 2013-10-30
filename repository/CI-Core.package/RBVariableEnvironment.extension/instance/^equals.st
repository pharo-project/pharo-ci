*CI-Core
= other
	super = other
		ifFalse: [ ^ false ].
	instanceVariables = other instanceVariables
		ifFalse: [ ^ false ].
	instanceVariableReaders = other instanceVariableReaders
		ifFalse: [ ^ false ].
	instanceVariableWriters = other instanceVariableWriters
		ifFalse: [ ^ false ].
	^ classVariables = other classVariables.