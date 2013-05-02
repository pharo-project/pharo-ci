accessing
testSoften
	| aResult aModifyResult |
	
	aResult := (self ruleForHardenTest) validate.
	aModifyResult := ((self ruleClass) rule: (self ruleForHardenTest)) validate.
	
	self assert: aResult failures isEmpty not.
	self assert: aResult messages size equals: 0.	
	self assert: aResult failures isEmpty not.
	
	self assert: aModifyResult warnings size equals: 0.	
	self assert: aModifyResult messages size equals: 0.	
	self assert: aModifyResult failures isEmpty not.	
		