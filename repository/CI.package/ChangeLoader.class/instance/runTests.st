testing
runTests

	| testClasses |
	testClasses := OrderedCollection new.	
	
	 testClasses addAll: (self class environment allClasses select: [:class | {'SUnit'. 'CompilerTests'. 'CollectionsTests'. 'KernelTests'} anySatisfy: [:packageName | class category beginsWith: packageName]]).
	testClasses := testClasses select: [:e | e inheritsFrom: TestCase ].

	^ (TestSuite new 
			addTests: ((testClasses
							select: [ :class| class isAbstract not ]) 
								gather: [:e | e suite tests])) run.