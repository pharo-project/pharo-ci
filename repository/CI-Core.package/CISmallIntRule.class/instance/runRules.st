validation
runRules
	| result |
	result := OrderedCollection new.
	self rules do: [ :rule |
		self inform: 'Running smallint rule: ', rule class name.
		[ rule run addResultTo: result ] on: Error do: [ :error |
			self inform: '    Rule Failed: ', error asString.
			self addError: error ]].
	^ result