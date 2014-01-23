testing
hasBeenClosed
	
	^ (self status ifNil: [ ^ false ]) beginsWith: 'Closed'