accessing
resetAllBlocks: aBlock
	"set all blocks to the given one"
	self
		beforeValidationBlock: aBlock;
		changeNotFoundBlock: aBlock;
		intermediateResultBlock: aBlock;
		validationResultBlock: aBlock