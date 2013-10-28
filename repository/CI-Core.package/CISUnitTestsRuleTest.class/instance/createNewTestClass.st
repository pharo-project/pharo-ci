tests
createNewTestClass
	^ TestCase subclass: (#CISUnitTestsRule_, self selector) asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: self defaultTestPackage 