private-XML code
issueXMLTitleOn: stream

	stream nextPutAll: '<title>'.
	self xmlEscape: self title on: stream.
	stream nextPutAll: '</title>'