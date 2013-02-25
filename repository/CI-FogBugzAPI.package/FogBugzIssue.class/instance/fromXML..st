accessing
fromXML: xml

	title := (xml findTag: 'stitle') children first text.
	project := (xml findTag: 'sproject') children first text.
	id := (xml attributeAt: 'ixBug') asInteger.
	events := (xml findTag: 'events') children collect: [:node | FogBugzEvent fromXML: node ].
	tags := (xml findTag: 'tags') children collect: [:e | e text ].