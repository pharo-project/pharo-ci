testing
dirtyPackagesTests
				
	| categories classes |				
	categories := MCWorkingCopy allManagers select: [ :each | each modified ] thenCollect: [:each| each package name ].
	categories := categories reject: [:e | e = 'KernelTests' ].
	classes := self class environment allClasses select: [:class | categories anySatisfy: [:name | class category beginsWith: name ]].
	^ classes select: [:e | (e inheritsFrom: TestCase) and: [ e isAbstract not ]].