as yet unclassified
removeFalsePositives: falsePositives from: results
	| converted |
	converted := results collect: [ :each |
		 self removeFalsePositives: falsePositives fromResult: each ].
	^ converted reject: [ :each | each isNil ]