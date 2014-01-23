tests
testLoadEmptyChange
	| rule result |
	rule := self newInstance.
	result := rule validate: self newChange.
	"The configuration validation needs a proper configuration source to be succesful"
	self assert: result isFailure.