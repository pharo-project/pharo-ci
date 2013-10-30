as yet unclassified
removeFalsePositives: falsePositives fromResult: rule
	"Try filtering out falsePositives for a given result."
	| matchingFalsePositive |
	
	"If there is no matching rule in the falsePositives, the rule is new and thus has can not have any false positives".
	matchingFalsePositive := falsePositives 
		detect: [ :each | each class = rule class ]
		ifNone: [ ^ rule ].
	
	"If the rule is exactly the same as the matchingFalsePositive the result is empty."
	rule = matchingFalsePositive 
		ifTrue: [ ^ nil ].
		
	rule removeFalsePositives: matchingFalsePositive.
	^ rule