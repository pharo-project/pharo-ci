accessing
addAttachment: anAttachment
	
	attachments add: anAttachment.
	anAttachment comment: self.
	
	^ anAttachment