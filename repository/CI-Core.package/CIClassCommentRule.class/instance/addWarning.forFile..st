adding
addWarning: aWarning forFile: aFileNameString
	warnings add:(String streamContents: [ :stream|
		aFileNameString ifNotNil: [ 
			stream << 'Warning ! ' << aFileNameString << ':'; lf].
		stream tab print: aWarning ;<< ' has no comment ...'])