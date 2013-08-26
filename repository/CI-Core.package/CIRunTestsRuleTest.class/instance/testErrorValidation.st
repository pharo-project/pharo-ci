tests
testErrorValidation
	| instance aResult |
	
	instance := self newInstance.
	aResult := instance validate: self newFailingChange. 
	
	self assert: aResult errors size > 0 description: 'Ensure there is errors'.