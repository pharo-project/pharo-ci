instance creation
forId: id

	^ self issues 
		detect: [ :e | e id = id ] 
		ifNone: [ FogBugzTracker penelope getIssueWithID: id ]