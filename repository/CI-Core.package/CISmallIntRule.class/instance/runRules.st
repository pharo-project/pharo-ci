validation
runRules
	| result |
	result := OrderedCollection new.
	self rules do: [ :rule |
		rule run addResultTo: result. ].
	^ result