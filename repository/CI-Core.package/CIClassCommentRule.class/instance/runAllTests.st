testing
runAllTests
	| noComment |
	
	noComment := OrderedCollection new.
	Smalltalk allClasses do:[ :aClass |
		aClass hasComment
			ifFalse: [ noComment add: aClass ]].
	^ testResult := noComment 