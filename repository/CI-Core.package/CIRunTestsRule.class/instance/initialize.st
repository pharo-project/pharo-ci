initialize-release
initialize
	super initialize.
	"Do not run the CI tests by default"
	selectTestCaseBlock := [ :testCaseClass | 
		(testCaseClass package name beginsWith: 'CI-') not ]