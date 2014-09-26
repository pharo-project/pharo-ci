executing
execute 
	self validate.
	[ 
		self withErrorHandlingDo: [ 
			success := false.
			self prepareEnvironment.
			self generateIntegrationScript.
			self runIntegration.
			self gitPublish. 
			success := true ] ]
	ensure: [ 
		self cleanUp ]