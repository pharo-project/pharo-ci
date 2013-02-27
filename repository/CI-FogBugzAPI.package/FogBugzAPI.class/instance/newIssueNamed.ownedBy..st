accessing
newIssueNamed: aName ownedBy: aOwner
	| response arguments |

	arguments := Dictionary new
		at: 'cmd' put: 'new';
		at: 'sPersonAssignedTo' put: aOwner;
		at: 'sTitle' put: aName;
		yourself.

	response := self 
		sendRequestWithArguments:arguments
		ifError: [ self error: 'TODO: Send a proper one' ].
	 
	^ FogBugzIssue fromXML: (Soup fromString: response contents).