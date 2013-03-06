private
extractMilestoneFrom: collection
	| milestone dashIndex |
	
	milestone := collection detect: [:e | e beginsWith: 'Milestone-' ] ifNone: [ ^ nil ].
	milestone := 'Pharo', (milestone copyFrom: 11 to: milestone size).
	dashIndex := milestone indexOf: $-.

	^ dashIndex isZero
		ifTrue: [ milestone ]
		ifFalse: [ milestone copyFrom: 1 to: dashIndex-1 ]
