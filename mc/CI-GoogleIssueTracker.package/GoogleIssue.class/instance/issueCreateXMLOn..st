integration-private
issueCreateXMLOn: stream

	self issueXMLHeaderOn: stream.
	self issueXMLDescriptionOn: stream.
	self issueXMLTitleOn: stream.
	self issueXMLAuthorOn: stream.
	self issueXMLStatusOn: stream.
	self issueXMLLabelsOn: stream.
	self issueXMLOwnerOn: stream.
	self issueXMLFooterOn: stream