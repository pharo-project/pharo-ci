accessing
newFailingChange
	^ CITestChange loadBlock: [ CIValidationResult error: 'failure' ]