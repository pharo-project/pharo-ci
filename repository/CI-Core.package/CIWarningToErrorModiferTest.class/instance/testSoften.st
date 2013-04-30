accessing
testSoften
	| aResult aModifyResult |
	
	
	aResult := CIValidationResult new.
	aResult addFailure: 'a'.
	aResult addMessage: 'b'.
	aResult addWarning: 'c'.
	aModifyResult := (CIWarningToErrorModifer new) modifyResult: aResult.
	
	self assert: aResult failures size equals: 1.	
	self assert: aResult messages size equals: 1.	
	self assert: aResult warnings size equals: 1.	
	
	self assert: aModifyResult failures size equals: 2.	
	self assert: aModifyResult messages size equals: 1.	
	self assert: aModifyResult warnings size equals: 0.	
		
	self assert: (aModifyResult failures first = 'a').
	self assert: (aModifyResult failures second = 'c').
	self assert: (aModifyResult messages first = 'b').