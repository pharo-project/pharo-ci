validation
recordValidationChangesDuring: aBlock
	self preLoadValidate.
	loadTime := aBlock timeToRun.
	self 
		postLoadValidate;
		removeFalsePositives.