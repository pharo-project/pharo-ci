image-evaluation
do: aBlock

	| worker process |
	
	worker := self new.
	process := self newPollProcessFor: worker.
	worker isForkedImage
		ifTrue: [ ^ self ].
		
	[ 
		| result |
		[ result := aBlock value: worker ] on: Error do: [ :e | e debug. ].
		^ result ]
	ensure: [ 
		[10 seconds wait. process terminate.
		worker close] fork ]