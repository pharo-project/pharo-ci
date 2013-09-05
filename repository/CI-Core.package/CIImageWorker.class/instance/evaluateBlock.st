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
	
	] ensure: [
		"Make sure that we always quit the image after running the block and serializing its contents."
		Exit signalSuccess.
		Error signal: 'Do not reopen a forked image' ]