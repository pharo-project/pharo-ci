private
extractMilestoneFrom:  collection
	| milestone |
	
	milestone := collection detect: [:e | e beginsWith: 'Milestone-' ] ifNone: [ ^ nil ].
	^ 'Pharo', (milestone copyFrom: 11 to: milestone size).