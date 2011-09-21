testing
runAllTests

	testResult := (TestSuite new 
				addTests: ((TestCase allSubclasses 
								select: [ :class| class isAbstract not ]) 
									gather: [:e | e suite tests])) run.