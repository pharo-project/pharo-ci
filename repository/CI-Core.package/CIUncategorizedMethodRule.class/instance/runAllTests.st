testing
runAllTests
	| notCategorized |
	
	notCategorized := OrderedCollection new.
	Smalltalk allClasses do:[ :aClass |
		(aClass allMethodsInCategory: 'as yet uncategorized') do:[ notCategorized add: aClass asString, '>>', notCategorized asString ]].
	^ testResult := notCategorized 