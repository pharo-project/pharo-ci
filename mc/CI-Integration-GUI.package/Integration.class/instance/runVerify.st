private executing
runVerify
	self runCommandWaitForAnswer: ('{1} {2} st --save {3}' 
		format: { 
			Smalltalk vm command. 
			(self workingDirectory / 'Pharo.image') fullName.
			(self workingDirectory / 'verify.st') fullName })