*CI-FogBugzAPI
migrateToFogBugzWith: aTracker
	|  newTitle project tags newIssue newId eventDescription |
	
	newTitle := self title.
	project := self fogbugzProject.
	tags := self labels.
	eventDescription := ''.
	
	newIssue := aTracker
		newIssueTitled: newTitle 
		ownedBy: self description author
		description: description
		tags: ''
		project: project.
	
	newId := newIssue id.	
	
	"Migrate description as fogbugz event for this issue"
	self comments do: [:comment | comment migrateToIssue: newId with: aTracker ].
	^ newIssue