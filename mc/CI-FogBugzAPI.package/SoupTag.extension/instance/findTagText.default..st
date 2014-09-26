*CI-FogBugzAPI
findTagText: tagName default: defaultValue
	^ (self findTag: tagName)
		ifNotNil: [ :tag | tag text ]
		ifNil: [ defaultValue ]  