tests
testLoadWarningChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newWarningChange.
	self assert: result isSuccess.
	self assert: result hasWarnings.