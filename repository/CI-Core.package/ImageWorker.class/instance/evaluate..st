image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifFalse: [ 
			(self remote at:#Object) new; inform: 'i''m working !'.
			1 halt.
			^ (self remote at:#ImageWorker) evaluateFromForkedImage: aBlock ]