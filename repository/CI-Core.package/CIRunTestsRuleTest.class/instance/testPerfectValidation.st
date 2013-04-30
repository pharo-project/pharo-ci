tests
testPerfectValidation
	| instance aResult |
	instance := self newInstance.
	instance change: ((CITestChange new) isLoadable: true; loadBlock: [true]). 
	aResult := (instance validate) .
	
	self assert: aResult failures size equals: 0.	
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.	