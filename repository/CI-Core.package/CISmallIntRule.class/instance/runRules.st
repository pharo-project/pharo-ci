validation
runRules
	| result |
	result := OrderedCollection new.
	self rules do: [ :rule |
		self inform: 'Running smallint rule: ', rule class name.
		rule run addResultTo: result. ].
	^ result