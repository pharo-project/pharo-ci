concatenation
addWith: anotherRule
	^ CIComposedPublisher 
		with: anotherRule 
		with: self