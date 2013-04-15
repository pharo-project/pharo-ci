accessing
tagsString
	^ String streamContents: [ :stream| self tagsStringOn: stream ]