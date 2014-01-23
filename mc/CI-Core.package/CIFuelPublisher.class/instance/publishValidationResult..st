file creation
publishValidationResult: aCIValidationResult
	self updateFileName: aCIValidationResult.
	
	FileStream forceNewFileNamed: self fileName, '.fuel' do: [:aStream |
		FLSerializer newDefault 
			showProgress;
			serialize: aCIValidationResult 
			on: aStream binary ].
	