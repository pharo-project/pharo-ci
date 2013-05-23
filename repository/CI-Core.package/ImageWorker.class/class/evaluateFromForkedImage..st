image-evaluation
evaluateFromForkedImage: aBlock
	Transcript cr; show: 'evaluation of block'.
	^ aBlock asLocalObject value