false positive handling
removeFalsePositives: falsePositives from: results
	
	^ results reject: [ :each || detected |
		self falsePositives: falsePositives includesResult: each ].
	