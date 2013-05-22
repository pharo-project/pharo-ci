image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifTrue: [ ^ aBlock value ]