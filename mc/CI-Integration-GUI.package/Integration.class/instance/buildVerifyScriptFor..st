private script
buildVerifyScriptFor: mergeBoolean
	^ self issues first 
		verifyScriptOn: self 
		merge: mergeBoolean
