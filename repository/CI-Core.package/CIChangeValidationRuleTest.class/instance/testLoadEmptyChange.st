tests
testLoadEmptyChange
	"Unlike the default case, the change validation rules fails if no change was provided."
	| rule result |
	rule := self newInstance.
	result := rule validate: self newChange.
	self assert: result isFailure .