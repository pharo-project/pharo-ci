as yet unclassified
fromXML: entryNode
	entryNode ifNil: [ ^ nil ].
	^ self email: (entryNode findTag: #name) text