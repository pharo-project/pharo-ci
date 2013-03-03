instance creation
fromXML: entryNode tracker: aTracker

	| issue |
	
	issue := self id: ((entryNode findTag: 'id') rescuedText subStrings: '/') last squeezeOutNumber.
	issue tracker: aTracker.	
	issue published: entryNode published rescuedText asDateAndTime.
	issue updated: entryNode updated rescuedText asDateAndTime.
	issue title: entryNode title rescuedText.
	issue status: (entryNode findTag: 'issues:status') rescuedText.

	issue description: ((GoogleIssueDescription fromXML: entryNode)
							issue: issue;
							yourself).
	
	issue labels: ((entryNode findAllTags: 'issues:label') 
							collect: [:element| element rescuedText]).
							
	issue xml: entryNode.
	
	^ issue