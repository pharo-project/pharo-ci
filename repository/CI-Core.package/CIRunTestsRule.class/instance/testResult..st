validation
testResult: aTestResult
	"process the test results "
	self addAllErrors: aTestResult errors.
	self addAllErrors: aTestResult errors.
	self addAllWarnings: aTestResult skipped.