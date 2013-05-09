tests
testPerfectValidation
	| instance aResult |
	
	instance := self newInstance.
	aResult := instance validate: (CITestChange loadBlock: [true]).
	
	self assert: aResult failures size equals: 0.	
	self assert: aResult messages size equals: 0.	
	self assert: aResult warnings size equals: 0.	