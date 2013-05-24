image-evaluation
evaluateFromForkedImage: aBlock	
	self inform: 'aBlock is currently running.'.
	^ aBlock asLocalObject value