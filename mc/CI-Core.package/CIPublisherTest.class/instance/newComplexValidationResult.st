accessing
newComplexValidationResult
	| result |
	result := CIValidationResult new.
	result change: (CITestChange new).
	result addError: 'foo'.
	result addError: ([ 0/0 ] on: Error do: [ :err | err freeze ]).
	result addError: ([ 0 notUnderStoodFoo ] on: Error do: [ :err | err freeze ]).
	^ result