protocol
validate
	self assertHasChange.
	self addValidationResult: (self newImageDo: [ 
			self remoteValidate ]).