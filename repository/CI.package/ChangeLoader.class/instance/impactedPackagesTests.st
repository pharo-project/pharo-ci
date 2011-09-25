testing
impactedPackagesTests
			
	| packages categories classes |
	
	packages := (MCVersion allInstances detect: [:each | 
								each info name = self slice name ]) dependencies.
	categories := packages collect: [:each | each package name ]. 
	categories := categories reject: [:e | e = 'KernelTests' ].
	
	classes := self class environment allClasses select: [:class | 
						categories anySatisfy: [:name | 
							class category beginsWith: name ]].
					
	^ classes select: [:e | (e inheritsFrom: TestCase) and: [ e isAbstract not ]].