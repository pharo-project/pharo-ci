*CI-FogBugzAPI
migrateToFogBugzWith: aTracker
	|  newTitle project tags newIssue newId eventDescription |
	
	newTitle := self title.
	project := self fogbugzProject.
	tags := self labels.
	eventDescription := 'Imported from: https://code.google.com/p/pharo/issues/detail?id=', self id asString.
	
	newIssue := aTracker
		newIssueTitled: newTitle 
		ownedBy: self description author
		description: eventDescription
		tags: ''
		project: project.
	
	newId := newIssue id.	
	
	"Migrate description as fogbugz event for this issue"
	self comments do: [:comment | comment migrateToIssue: newId with: aTracker ].
	
	"Next step is to flag this issue as migrated and add a comment with the link"
	self labels: self labels, {'MigratedToFogBugz'}.
	self submitStatusChange: ('Issue migrated to https://pharo.fogbugz.com/f/cases/', newId asString).
	
	^ newIssue