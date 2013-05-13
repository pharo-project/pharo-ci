tests
testLoadFailingChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newFailingChange.
	self halt.
	self assert: result isFailure.