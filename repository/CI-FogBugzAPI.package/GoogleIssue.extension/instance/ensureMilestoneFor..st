*CI-FogBugzAPI
ensureMilestoneFor:  newTracker
	| newId milestone |

	newId := self comments last content asInteger.
	milestone := newTracker extractMilestoneFrom: self labels.
	milestone ifNil: [ ^ self ].
	^ newTracker 
		editIssue: newId 
		withArguments: (Dictionary new
							at: 'sFixFor' put: milestone;
							yourself).