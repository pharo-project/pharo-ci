validation
testResult: aTestResult
	"process the test results "
	self addAllErrors: aTestResult failures.
	self addAllErrors: aTestResult errors.