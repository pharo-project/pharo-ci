as yet unclassified
migrateAll
	self allIssues do: [ :each |
		each migrateToFogBugzWith: self fogBugzTracker ]