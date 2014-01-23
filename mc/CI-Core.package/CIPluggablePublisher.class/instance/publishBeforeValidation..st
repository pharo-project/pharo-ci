publishing
publishBeforeValidation: aCIChange
	self beforeValidationBlock ifNotNil: [ 
		self beforeValidationBlock cull: aCIChange ]