as yet unclassified
runRules
	| result |
	result := OrderedCollection new.
	self rules do: [ :rule |
		result add: rule run result ].
	^ result