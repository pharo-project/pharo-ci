adding
addWarning: aWarning 
	warnings add:(String streamContents: [ :stream |
		stream tab print: aWarning ;<< ' has no comment ...']) 