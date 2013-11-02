testing
canBeChecked
	^ self subcases allSatisfy: [ :case | case hasBeenClosed ]