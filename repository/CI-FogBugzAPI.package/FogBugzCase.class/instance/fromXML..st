accessing
fromXML: xml
	| projectId |
	
	title     := (xml findTag: 'stitle') children first text.
	
	projectId := (xml findTag: 'ixproject') children first text asInteger.
	project := FogBugzProject id: projectId.
	project title: (xml findTag: 'sproject') children first text.
	
	id     := (xml attributeAt: 'ixBug') asInteger.
	events := (xml findTag: 'events') children collect: [:node | FogBugzEvent fromXML: node ].
	tags   := (xml findTag: 'tags') children collect: [:e | e text ].
	
	(xml findTag: 'sfixfor')
		ifNotNil: [ :tag | milestone := tag next text ].
	(xml findTag: 'ixbugchildren')
		ifNotNil: [ :tag |
			tag text isEmpty
				ifTrue: [ subcases := { } ]
				ifFalse: [ subcases := (tag text splitOn: $,) collect: [ :each | each asInteger ]]].
	(xml findTag: 'ixBugParent')
		ifNotNil: [ :tag | parentCase := tag text asInteger ].
	
	status := xml sstatus next text.
	
	lastModification := xml dtlastupdated text asDateAndTime.

	dateOpened := xml dtopened next text asDateAndTime.
	
	self hasBeenResolved
		ifTrue: [	dateResolved := xml dtresolved next text asDateAndTime ].
	self hasBeenClosed
		ifTrue: [dateClosed := xml dtclosed next text asDateAndTime ].
	
	user := FogBugzUser
		id: (xml findTag: 'ixperson') next text asInteger
		username: (xml findTag: 'sperson') next text
		mail: nil.