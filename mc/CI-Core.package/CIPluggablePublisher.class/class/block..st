instance creation
block: aBlock
	" create an instance using the same block for all actions."
	^ self new
		resetAllBlocks: aBlock;
		yourself