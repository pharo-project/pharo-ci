instance-creation
newImageDo: aBlock onTimeout: anErrorBlock
	| result |
	result := ImageWorker 
		do: aBlock
		within: self timeout
		onTimeout: anErrorBlock.
	^ result