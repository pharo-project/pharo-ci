tests
testErrorValidation
	| instance aResult |
	
	instance := self newInstance.
	aResult := instance validate: self newFailingChange. 
	
	self assert: aResult isFailing.