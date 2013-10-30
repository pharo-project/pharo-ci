testing
testRemoveFalsePositivesFrom
	| rule errors |
	
	rule := self newInstance.
	
	errors := rule removeFalsePositive: self beforeErrors forRule: self beforeErrors.
	self assert: errors isEmpty.
	
	errors := rule removeFalsePositive: self afterErrors forRule: self afterErrors.
	self assert: errors isEmpty.
	
	errors := rule removeFalsePositive: self beforeErrors forRule: self afterErrors.
	self deny: errors isEmpty.
	
	errors := rule removeFalsePositive: self afterErrors forRule: self beforeErrors.
	self assert: errors isEmpty.