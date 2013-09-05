private - forked image
evaluateBlock
	| result isError |
	[
		isError := false.
		[ result := block value ]
			on: Error do: [ :error |
				isError := true.
				result := error freezeUpTo: thisContext home ].
			
		self serializeResult: result isError: isError
	
	] ensure: [ Exit success ]