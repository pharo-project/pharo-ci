private executing
generateVerifyScriptFor: mergeBoolean
	(self workingDirectory / 'verify.st') 
		writeStreamDo: [ :stream | stream << (self buildAuthorScriptWith: (self buildVerifyScriptFor: mergeBoolean)) ]