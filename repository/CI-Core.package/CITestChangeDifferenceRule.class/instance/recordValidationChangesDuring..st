validation
recordValidationChangesDuring: aBlock
	self preLoadValidate.
	aBlock value.
	self postLoadValidate.