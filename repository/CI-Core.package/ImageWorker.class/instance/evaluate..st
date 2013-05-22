image-evaluation
evaluate: aBlock
	self isForkedImage 
		ifFalse: [ 
			(self remote at:#Object) new; inform: 'i''m working !'.
			^ (self remote at:#ImageWorker) evaluateFromForkedImage: aBlock ]