tests
testErrorValidation
	| instance aResult |
	instance := self newInstance.
	aResult := instance validate: (CITestChange new isLoadable: true; loadBlock: [true]). 
	
	self assert: aResult failures size > 0.	
	self assert: aResult messages size > 0.	
	self assert: aResult warnings size equals: 0.	