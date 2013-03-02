migrating
allIssues
	| issues |
	
	"try issues which are not already migrated"
	issues := self googleTracker issuesWithParams: self nextIssueParams.
	issues ifEmpty: [ ^ nil ].
	
	^ (issues sorted: [ :a :b | a id < b id ])