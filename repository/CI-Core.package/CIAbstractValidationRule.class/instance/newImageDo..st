instance-creation
newImageDo: aBlock
	| result |
	result := ImageWorker evaluate: aBlock.	
	^ result