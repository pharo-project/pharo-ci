tests
testLoadEmptyChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newChange.
	self assert: result isSuccess.