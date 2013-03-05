instance creation
fromXML: xml 

	parent := FogBugzCase id: ((xml attributeAt: 'ixBug') asInteger).
	id := (xml attributeAt: 'ixBugEvent') asInteger.
	attachements := Set new.

	comment := (xml findTag: 's')
						ifNil: [ '' ]
						ifNotNil: [:node | node children isEmpty
											ifTrue: [ node text ]
											ifFalse: [ node children first text ]].	
							
	description := (xml findTag: 'evtdescription') children first text.
							
	(xml findTag: 'rgattachments') children allButLast 		
		collect: [:node | 
			attachements 
			add: ((FogBugzAttachment parent: id)
						fromXML: node;
						yourself) ].