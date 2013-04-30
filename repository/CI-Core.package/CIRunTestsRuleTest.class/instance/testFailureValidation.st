tests
testFailureValidation
	| instance aResult |
	instance := self newInstance.
	instance change: ((CITestChange new) isLoadable: false). 
	aResult := (instance validate) .
	
	"could be a failure, no change "
	self assert: aResult failures size equals: 1.
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.	