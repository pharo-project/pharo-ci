image-evaluation
do: aBlock

	| worker process |
	
	worker := self new.
	process := self newPollProcessFor: worker.
		
	[ 
		worker isForkedImage
			ifFalse: [ aBlock value: worker ] ]
	ensure: [ 
		process terminate.
		worker close ]