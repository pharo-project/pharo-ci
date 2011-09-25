testing
impactedPackagesTests
			
	| repo packages categories classes |
	
	repo := MCHttpRepository allInstances detect: [: e| e description = 'http://ss3.gemstone.com/ss/PharoInbox' ].
	packages := (repo versionReaderForFileNamed: (repo allFileNames detect:[:e | e includesSubString: self slice name]) ) dependencies.
	categories := packages collect: [:each | each package name ]. 
	categories := categories reject: [:e | e = 'KernelTests' ].
	
	classes := self class environment allClasses select: [:class | 
						categories anySatisfy: [:name | 
							class category beginsWith: name ]].
					
	^ classes select: [:e | (e inheritsFrom: TestCase) and: [ e isAbstract not ]].