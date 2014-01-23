instance creation
changeBlock: aBlock
	^ self new
		changeBlock: aBlock;
		yourself