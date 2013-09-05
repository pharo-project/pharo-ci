private - forked image
serializeResult: result isError: isError
	[
		{ result. isError } serializeToFileNamed: self resultFile fullName 
	] on: Error do: [ :error |
		self inform: 'Could not serialize result ', error messageText.
		error pass ]