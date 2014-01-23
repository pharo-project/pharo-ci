testing
testRemoveFalsePositivesFrom
	| rule errors |
	
	rule := self newInstance.
	
	errors := rule 
		removeFalsePositives: self beforeErrors
		from: self beforeErrors.
	self assert: errors isEmpty.
	
	errors := rule
		removeFalsePositives: self afterErrors
		from: self afterErrors.
	self assert: errors isEmpty.
	
	errors := rule
		removeFalsePositives: self beforeErrors
		from: self afterErrors.
	self deny: errors isEmpty.
	
	errors := rule
		removeFalsePositives: self afterErrors
		from: self beforeErrors.
	self assert: errors isEmpty.