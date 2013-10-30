validation
runRules
	| result |
	result := OrderedCollection new.
	self rules do: [ :rule |
		self inform: 'Running smallint rule: ', rule class name.
		[ rule run addRulesTo: result ] on: Error do: [ :error |
			self inform: '    Rule Failed: ', error asString.
			self addError: error ]].
	VTermOutputDriver stderr red: result first result classes size asString; lf. 
	^ result collect: #result