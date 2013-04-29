adding
addAllWarnings: aCollection
	aCollection do: [ :error |
		self addWarning: error ]