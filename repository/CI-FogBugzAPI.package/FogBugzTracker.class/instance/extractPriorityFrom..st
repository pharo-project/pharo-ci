private
extractPriorityFrom: collection
	| priority |
	
	priority := collection detect: [:e | e beginsWith: 'Importance-' ] ifNone: [ ^ nil ].
	priority := priority copyFrom: 12 to: priority size.
	
	priority = 'Low' ifTrue: [ ^ '4 - Fix if Time' ].
	priority = 'High' ifTrue: [ ^ '5 - Really Important' ].

	^ nil