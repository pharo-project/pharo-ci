instance creation
fromXML: entryNode

	| comment idString |
	
	idString := entryNode id rescuedText.
	
	comment := self id: (idString copyFrom: (idString lastIndexOf: $/) + 1 to: idString size) asInteger. 
	
	comment published: entryNode published rescuedText asDateAndTime.
	comment updated: entryNode updated rescuedText asDateAndTime.
	comment title: entryNode title rescuedText trimBoth.
	comment content: entryNode content rescuedText trimBoth.
	comment author: (GoogleUser fromXML: entryNode author).
	comment status: ((entryNode findTag: 'issues:status') ifNotNil: [:s| s  rescuedText ]).
	comment labels: ((entryNode findAllTags: 'issues:label') 
							collect: [:element| element rescuedText]).
							
	comment xml: entryNode.
	
	^ comment