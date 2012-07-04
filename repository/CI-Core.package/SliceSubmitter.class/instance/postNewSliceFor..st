protocol
postNewSliceFor: workingCopy

	workingCopy ifNil: [ ^ self ].
	self commit: workingCopy in: MCHttpRepository inboxRepository