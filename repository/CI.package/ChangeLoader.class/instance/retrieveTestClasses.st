initialize
retrieveTestClasses

	testClasses := OrderedCollection new.	
	
	 testClasses addAll: (self class environment allClasses select: [:class | {'SUnit'. 'CompilerTests'. 'CollectionsTests'. "'KernelTests'"} anySatisfy: [:packageName | class category beginsWith: packageName]]).
	testClasses := testClasses select: [:e | (e inheritsFrom: TestCase) and: [ e isAbstract not ]].