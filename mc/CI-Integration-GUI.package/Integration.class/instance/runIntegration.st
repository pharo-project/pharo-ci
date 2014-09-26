private executing
runIntegration
	self runCommandWaitForAnswer: ('{1} {2} {3} st --save --quit {4}' 
		format: { 
			Smalltalk vm command. 
			self headlessFlag.
			(self workingDirectory / 'Pharo.image') fullName.
			(self workingDirectory / 'integration.st') fullName }).
	self extractBuildId.