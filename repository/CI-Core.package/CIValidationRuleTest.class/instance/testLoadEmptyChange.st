tests
testLoadEmptyChange
	| rule result |
	rule := self newInstance.
	result := self validate: rule.
	self assert: result isSuccess.