adding
addAllErrors: aCollection
	aCollection do: [ :error |
		self addError: error ]