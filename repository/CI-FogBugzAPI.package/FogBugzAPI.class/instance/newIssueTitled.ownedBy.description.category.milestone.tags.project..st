protocol-edition
newIssueTitled: aName ownedBy: aOwner description: description category: category milestone: milestone tags: tags project: project
	| response arguments xml id |

	arguments := Dictionary new
		at: 'cmd' put: 'new';
		at: 'sPersonAssignedTo' put: aOwner;
		at: 'sTitle' put: aName;
		at: 'sProject' put: project;
		yourself.

	category
		ifNotNil: [ arguments at: 'sCategory' put: category ].
		
	milestone
		ifNotNil: [ arguments at: 'sFixFor' put: milestone ].
		
	tags ifNotEmpty: [	arguments at: 'sTags' put: (tags joinUsing:',') ].
		
	response := self 
		sendRequestWithArguments:arguments
		ifError: [ self error: 'TODO: Send a proper one' ].
		
	xml := Soup fromString: response contents.
	id := (xml / 'response') child first @ 'ixBug'.
	 
	^ self getIssueWithID: id asInteger