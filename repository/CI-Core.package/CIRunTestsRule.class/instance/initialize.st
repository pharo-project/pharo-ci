initialize-release
initialize
	super initialize.
	"Do not run the CI tests by default"
	selectTestCaseBlock := self defaultSelectTestCaseBlock