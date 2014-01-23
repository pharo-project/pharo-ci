publishing
publishMessages: aCIValidationResult
	self xmlWriter
		writeWith: [ :writer | writer tag: 'message' with: [ aCIValidationResult messages do: [ :aMessage | writer tag: 'result' with: aMessage ] ] ]