tests
testSetManager
	| manager |
	
	self assert: instance manager isNil.
	
	manager := self newManager.
	instance manager: manager.
	self assert: instance manager equals: manager