tests
testLoadSuccessfulChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newSuccessfulChange.
	self assert: result isSuccess.