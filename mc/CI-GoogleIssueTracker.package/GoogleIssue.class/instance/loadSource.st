loading
loadSource

	self hasSlice ifTrue: [ ^ self loadSlice ].
	self hasAttachment ifTrue: [ ^ self loadAttachments ].
	
	self error: 'Nothing to do'