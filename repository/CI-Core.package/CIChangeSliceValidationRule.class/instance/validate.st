protocol
validate

	self addValidationResult: (self newImageDo: [ 
			self
				testIsLoadable;
				validationResult ]).