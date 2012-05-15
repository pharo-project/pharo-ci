instance creation
fromXML: entryNode tracker: aTracker

	| issue |
	
	issue := self id: (entryNode findTag: 'issues:id') text asInteger.
	issue tracker: aTracker.	
	issue published: entryNode published text asDateAndTime.
	issue updated: entryNode updated text asDateAndTime.
	issue title: entryNode title text.
	
	issue description: ((GoogleIssueDescription fromXML: entryNode)
							issue: issue;
							yourself).
	
	issue labels: ((entryNode findAllTags: 'issues:label') 
							collect: [:element| element text]).
	
	^ issue