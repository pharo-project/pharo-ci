as yet unclassified
fromXML: entryNode
	^ self email: (entryNode findTag: #name) text