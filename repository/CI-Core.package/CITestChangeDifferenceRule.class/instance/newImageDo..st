validation
newImageDo: aBlock
	| result |
	result := "ImageWorker evaluate: " CIImageForker newImageDo: aBlock.
	
	^ result