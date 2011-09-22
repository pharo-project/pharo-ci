testing
runTests

	| classesToTest |
	
	classesToTest := testClasses.
	classesToTest addAll: self dirtyPackagesTests.

	^ (TestSuite new 
			addTests: ((testClasses
							select: [ :class| class isAbstract not ]) 
								gather: [:e | e suite tests])) run.