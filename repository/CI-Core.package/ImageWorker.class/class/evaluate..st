image-evaluation
evaluate: aBlock
	| worker result |
	
	worker := self new.
	[worker isForkedImage 	
		ifFalse: [result := worker evaluate: aBlock]] ensure: [worker close].
	^ result