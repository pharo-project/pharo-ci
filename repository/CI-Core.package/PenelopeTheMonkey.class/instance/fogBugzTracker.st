accessing
fogBugzTracker

	^ fogBugzTracker ifNil: [ fogBugzTracker :=  FogBugzAPI pharo ]