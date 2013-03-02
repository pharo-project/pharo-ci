migrating
migrateAll

	self allIssues do: [ :each | each migrateToFogBugzWith: self fogBugzTracker ]