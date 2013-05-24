validation
newImageDo: aBlock
	| result |
	
	self flag: 'should be removed when using ImageWorker'.
	self flag: 'result := self ImageWorker evaluate: aBlock'.
	result := self imageForker newImageDo: aBlock.
	
	^ result