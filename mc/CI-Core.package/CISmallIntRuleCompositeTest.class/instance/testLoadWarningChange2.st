tests
testLoadWarningChange2
	| rule result |
	rule := self newInstance.
	result := rule validate: self newWarningChange2.
	self assert: result isSuccess.
	self assert: result hasWarnings.