accessing
inboxProjectName
	^ String streamContents: [ :stream |
		stream << 'Pharo' << self flattenVersion << 'Inbox' ]