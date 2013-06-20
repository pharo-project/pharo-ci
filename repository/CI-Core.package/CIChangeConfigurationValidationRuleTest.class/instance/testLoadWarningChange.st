tests
testLoadWarningChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newSuccessfulChange.
	result := (CIErrorToWarningModifer new modifyResult: result) validationResult. 
	self assert: result isSuccess.
