accessing
fogBugzTracker

	^ fogBugzTracker ifNil: [ fogBugzTracker :=  FogBugzAPI penelope ]