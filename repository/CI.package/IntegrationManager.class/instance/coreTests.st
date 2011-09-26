tests
coreTests
	| tests |
	
	tests := self class environment allClasses select: [:class | 
		{'SUnit'. 'CompilerTests'. 'CollectionsTests'} 
			anySatisfy: [:packageName | 
				class category beginsWith: packageName ]].
	
	self isCog ifTrue: [ ^ tests ].
	
	"add the KernelTest if we're not running on Cog as it currently fails randomly if the KernelTests are included"
	tests addAll: (self class environment allClasses select: [:class | 
		{'KernelTests'} 
			anySatisfy: [:packageName | 
				class category beginsWith: packageName ]]).
	
	^ tests