protocol
validate

	self addValidationResult: (self newImageDo: [ 
			self remoteValidate ]).