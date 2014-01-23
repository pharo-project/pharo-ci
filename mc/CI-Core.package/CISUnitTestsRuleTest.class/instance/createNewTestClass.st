tests
createNewTestClass
	| className |
	className := (#CISUnitTestsRule_, self selector) asSymbol.
	className asClassIfPresent: [ Error signal: 'Test class "', className, '" already exists!' ].
	^ TestCase subclass: className
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: self defaultTestPackage 