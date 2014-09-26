accessing
tracker

	^ tracker ifNil: [ tracker := FogBugzTracker pharo ]