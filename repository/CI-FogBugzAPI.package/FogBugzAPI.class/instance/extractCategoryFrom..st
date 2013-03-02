private
extractCategoryFrom: collection
	| type |
	
	type := collection detect: [:e | e beginsWith: 'Type-' ] ifNone: [ ^ nil ].
	type := type copyFrom: 6 to: type size.
	
	type = 'Bug' ifTrue: [ ^ 'Bug' ].
	type = 'FirstImpressionsCount' ifTrue: [ ^ 'First Impressions Counts' ].
	type = 'Feature' ifTrue: [ ^ 'Feature' ].
	type = 'Enh' ifTrue: [ ^ 'Enhancement' ].
	type = 'Cleanup' ifTrue: [ ^ 'Cleanup' ].
	type = 'FailingTest' ifTrue: [ ^ 'Failing Test' ].

	^ nil