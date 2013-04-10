printing
failureString
	^ String streamContents: [ :str |
		self printFailuresOn: str ]