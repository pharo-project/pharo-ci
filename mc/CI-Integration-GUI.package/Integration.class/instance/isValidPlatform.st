private
isValidPlatform
	^ Smalltalk os isMacOSX 
		or: [ Smalltalk os isUnix  ] 