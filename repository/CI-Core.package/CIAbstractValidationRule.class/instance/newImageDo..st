instance-creation
newImageDo: aBlock
	| result |
	result := CIImageWorker do: aBlock.
	^ result