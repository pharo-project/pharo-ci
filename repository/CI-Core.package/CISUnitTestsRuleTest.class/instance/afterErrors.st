accessing
afterErrors
	^ self beforeErrors, { TestCase selector: #afterFailure }