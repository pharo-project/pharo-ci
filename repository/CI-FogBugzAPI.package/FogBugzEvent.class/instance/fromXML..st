instance creation
fromXML: xml 

	case := FogBugzCase id: ((xml attributeAt: 'ixBug') asInteger).
	id := (xml attributeAt: 'ixBugEvent') asInteger.
	attachements := Set new.

	comment := (xml findTag: 's')
						ifNil: [ '' ]
						ifNotNil: [:node | node children isEmpty
											ifTrue: [ node text ]
											ifFalse: [ node children first text ]].	
						
	date := xml dt text asDateAndTime.
	description := xml evtdescription next text.
	changes := (xml findTag: 'schanges') next name = 'sformat'
					ifTrue: [ nil ] 
					ifFalse: [ (xml findTag: 'schanges') next text trimBoth ].
	(xml findTag: 'rgattachments') children allButLast 		
		collect: [:node | 
			attachements 
			add: ((FogBugzAttachment event: id)
						fromXML: node;
						yourself) ].