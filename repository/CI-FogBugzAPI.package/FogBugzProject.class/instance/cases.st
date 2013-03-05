queries
cases

	^ cases ifNil: [ self refreshCases ]