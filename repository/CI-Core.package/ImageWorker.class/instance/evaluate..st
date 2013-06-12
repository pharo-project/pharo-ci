image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifFalse: [ 
			^ aBlock value: self remote ]