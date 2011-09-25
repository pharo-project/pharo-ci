testing
removeCogCriticalTestsFrom: aTestSuite

	self isCog	 ifFalse: [ ^ aTestSuite ].
		
		
	^ aTestSuite