printing
printFailuresOn: aStream
	aStream 
		nextPutAll:'Failures:'; cr;
		nextPutAll:'---------'; cr.
	self failures
		do: [ :failure | failure printOn: aStream ]
		separatedBy: [ aStream cr ]