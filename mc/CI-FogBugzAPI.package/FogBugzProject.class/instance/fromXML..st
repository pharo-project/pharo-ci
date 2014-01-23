accessing
fromXML: xml

	title := (xml findTag: 'sproject') children first text.
	id := (xml findTag: 'ixproject') next asString asInteger.
	
	isInbox := (xml findTag: 'finbox') next text = 'true'.
	
	owner := FogBugzUser
				id: (xml findTag: 'ixpersonowner') next text asInteger
				username: (xml findTag: 'spersonowner') next text
				mail: (xml findTag: 'semail') next text.