acessing
attachments
	"return a list of unique attachments.
	Note: 
		This list only includes the latest version of an attachment.
		For a complete list see GoogleIssue >> #allAttachmnens"
	attachements ifNil: [ attachements := self loadAttachments ].
	^ attachements reversed asSet asArray
	