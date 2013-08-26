initialize-release
defaultSelectTestCaseBlock
	"I return a default test block that filters out certain packages that would cause trouble when testing during a validation process."
	^ [ :testCaseClass | 
		#('CI-' 'OSProcess-' 'CommandShell-' ) noneSatisfy: [ :packagePrefix |
			testCaseClass package name beginsWith: packagePrefix ]]