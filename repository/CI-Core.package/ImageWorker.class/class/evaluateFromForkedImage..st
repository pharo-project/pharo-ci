image-evaluation
evaluateFromForkedImage: aBlock	
	| result |
	self inform: 'aBlock is currently running.'.
	result := (aBlock asLocalObject value).
	^ result