tests
testNoBlocks
	" check that all publishing hooks work even without blocks"
	| publisher |
	publisher := CIPluggablePublisher new.
	
	publisher 
		publishBeforeValidation: #aValue;
		publishChangeNotFound: #aValue;
		publishIntermediateResult: #aValue;
		publishValidationResult: #aValue.