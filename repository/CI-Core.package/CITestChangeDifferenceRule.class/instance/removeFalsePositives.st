false positive handling
removeFalsePositives
	previousResult 
		ifNil: [ ^ self ].

	errors := self 
		removeFalsePositives: previousResult failures 
		from: errors.
		
	warnings := self 
		removeFalsePositives: previousResult warnings 
		from: warnings.
		
	messages := self 
		removeFalsePositives: previousResult messages 
		from: messages.