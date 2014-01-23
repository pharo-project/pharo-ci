printing
errorString
	^ String streamContents: [ :str |
		self printErrorsOn: str ]