validation
testResult: aTestResult
	"process the test results "
	self 
		addAllErrors: aTestResult failures;
		addAllErrors: aTestResult errors;
		addAllWarnings: aTestResult skipped.