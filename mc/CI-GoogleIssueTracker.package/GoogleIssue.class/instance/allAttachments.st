acessing
allAttachments
	"return a list of all attachments ordered by date. oldest first.
	Note: 
		this might includes duplicates as resubmitted attachments do not overwrite old ones.
		For a unique list see GoogleIssue >> #attachemnts"
	^ attachements ifNil: [ attachements := self loadAttachments ] 