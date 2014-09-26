editing
newIssueTitled: aName ownedBy: aOwner description: description tags: tags project: project
	| response arguments xml id |

	arguments := Dictionary new
		at: 'cmd' put: 'new';
		at: 'sPersonAssignedTo' put: aOwner;
		at: 'sTitle' put: aName;
		at: 'sProject' put: project;
		yourself.

	self analyzeLabels: tags andFill: arguments.

	description ifNotNil: [ arguments at: 'sEvent' put: description ].

	response := self 
		sendRequestWithArguments:arguments
		ifError: [ self error: 'TODO: Send a proper one' ].
		
	xml := Soup fromString: response contents.
	id := (xml / 'response') child first @ 'ixBug'.
	 
	^ self getIssueWithID: id asInteger