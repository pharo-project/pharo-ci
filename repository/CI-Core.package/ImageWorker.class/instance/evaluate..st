image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifFalse: [ 
			self halt.
			^ (self remote at:#ImageWorker) evaluateFromForkedImage: aBlock ]