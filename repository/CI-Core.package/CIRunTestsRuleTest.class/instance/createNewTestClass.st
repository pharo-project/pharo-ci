tests
createNewTestClass
	^ (TestCase subclass: (#CIRunTestsRule_, self selector) asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: self defaultTestPackage) asLocalObject 