tests
testLoadEmptyChange
	| rule result |
	rule := self ruleClass selectTestCaseBlock: [ :aClass | aClass = ObjectTest ]	.
	result := rule validate: self newChange.
	self assert: result isSuccess.