accessing
newFailingChange
	^ CITestChange loadBlock: [ CIValidationResult failure: 'failure' ]