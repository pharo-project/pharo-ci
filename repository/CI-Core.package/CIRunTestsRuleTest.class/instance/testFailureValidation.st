tests
testFailureValidation
	| instance aResult |
	instance := self newInstance.
	
	aResult := instance validate: (CITestChange new isLoadable: false). 
	
	"could be a failure, no change "
	self assert: aResult failures size equals: 1.
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.	