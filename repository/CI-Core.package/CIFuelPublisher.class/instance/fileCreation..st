file creation
fileCreation: aCIValidationResult
	FileStream forceNewFileNamed: aCIValidationResult change name asString, '.fuel' do: [:aStream |
		FLSerializer newDefault 
			showProgress;
			serialize: aCIValidationResult 
			on: aStream binary ].
	