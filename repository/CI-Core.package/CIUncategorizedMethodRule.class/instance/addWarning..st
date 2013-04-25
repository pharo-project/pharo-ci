adding
addWarning: aWarning
	warnings add:(String streamContents: [ :stream |
		stream tab print: aWarning ;<< ' is not yet categorized ...'])