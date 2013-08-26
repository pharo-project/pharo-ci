adding
addAllMessages: aCollection
	aCollection do: [ :error |
		self addMessage: error ]