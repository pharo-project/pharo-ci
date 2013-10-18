*CI-Core-Validation
addRulesTo: results
	self rules do: [ :rule |
		rule addRulesTo: results ].