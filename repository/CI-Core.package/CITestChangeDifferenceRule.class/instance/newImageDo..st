validation
newImageDo: aBlock
	| result |
	
	result := self imageForker newImageDo: aBlock.
	
	^ result