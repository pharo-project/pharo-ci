executing
executeVerifyMerge: mergeBoolean
	self validate.
	[ 
		self withErrorHandlingDo: [ 
			self prepareEnvironment.
			self generateVerifyScriptFor: mergeBoolean.
			self runVerify ] ]
	ensure: [ 
		self cleanUp ]