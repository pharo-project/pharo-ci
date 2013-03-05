accessing
tracker

	^ tracker ifNil: [ tracker := FogBugzTracker penelope ]