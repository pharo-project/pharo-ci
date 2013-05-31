image-evaluation
evaluateFromForkedImage: aBlock	
	| result |
	self inform: 'aBlock is currently running.'.
	[result := (aBlock asLocalObject value)] on: Error do: [:e |  VTermOutputDriver stderr red: e asString ] .
	^ result