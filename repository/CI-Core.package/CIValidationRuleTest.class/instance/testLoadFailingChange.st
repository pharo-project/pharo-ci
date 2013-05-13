tests
testLoadFailingChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newFailingChange.
	self assert: result isFailure.