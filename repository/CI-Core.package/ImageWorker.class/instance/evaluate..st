image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifFalse: [ 
			^ (self remote at:#ImageWorker) evaluateFromForkedImage: aBlock ]