accessing
fromXML: xml
	| projectId |
	
	title := (xml findTag: 'stitle') children first text.
	projectId := (xml findTag: 'ixproject') children first text asInteger.
	
	project := FogBugzProject id: projectId.
	project title: (xml findTag: 'sproject') children first text.
	id := (xml attributeAt: 'ixBug') asInteger.
	events := (xml findTag: 'events') children collect: [:node | FogBugzEvent fromXML: node ].
	tags := (xml findTag: 'tags') children collect: [:e | e text ].