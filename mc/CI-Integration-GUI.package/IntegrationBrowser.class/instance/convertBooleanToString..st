private
convertBooleanToString: aBoolean 
	^ aBoolean 
		ifTrue: [ 'X' ]
		ifFalse: [ '' ]