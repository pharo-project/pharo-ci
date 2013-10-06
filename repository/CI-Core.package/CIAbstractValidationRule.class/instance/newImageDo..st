instance-creation
newImageDo: aBlock
	| result |
	result := ImageWorker do: aBlock.
	^ result