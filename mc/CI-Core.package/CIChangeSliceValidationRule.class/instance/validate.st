protocol
validate
	self assertHasChange.
	[ self addValidationResult: (self newImageDo: [ 
			self remoteValidate ]) 
	] on: Error do: [ :e |
		self
			addError: 'A critical error happened while loading ', self change asString;
			addError: e freeze ].