*CI-Integration
checkImageIsUptodateSilently

	| stream last number |
	self class checkImageInSyncWithUpdate 
		ifFalse: [^ true].	
	
	stream := (FileDirectory default oldFileOrNoneNamed: self updatesListFileName).
	
	stream
		ifNil: [ stream := FileDirectory default forceNewFileNamed: self updatesListFileName ].
		
	stream contents linesDo: [ :each | last := each ].
	stream close.
	last isNil 
		ifTrue: [^ false]. "in case the file is empty"
	 (last copyUpTo: $-) isAllDigits
		ifFalse: [^ true].  			"for cases where we have #Pharo1.1rc1 starting the line"
	number := (last copyUpTo: $-) asNumber.
	^ number = self getLatestUpdateNumber.