accessing
tracker

	^ tracker ifNil: [ tracker := GoogleIssueTracker pharo ]