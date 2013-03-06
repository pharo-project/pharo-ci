testing
hasBeenResolved
	
	^ ((self status ifNil: [ ^ false ]) beginsWith: 'Resolved') or: [ self status beginsWith: 'Closed' ]