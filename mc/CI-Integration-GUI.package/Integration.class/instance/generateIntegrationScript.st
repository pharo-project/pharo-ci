private executing
generateIntegrationScript
	(self workingDirectory / 'integration.st') 
		writeStreamDo: [ :stream | stream << (self buildAuthorScriptWith: self buildIntegrationScript) ]
