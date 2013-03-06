accessing
fogBugzTracker

	^ fogBugzTracker ifNil: [ fogBugzTracker :=  FogBugzTracker penelope ]