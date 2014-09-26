protocol
changeWithId: fileName
	
	self script: (CIScriptChange file: fileName asFileReference).
	^ script