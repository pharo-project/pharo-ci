issues
nextIssue
	
	"choose the next issue to check by ulysse"
	
	| issues |
	
	"try issues which are new and unprrocessed"
	issues := self issuesWithParams: 'can=open&status=', PharoTrackerLabels reviewNeeded.
	^ issues detect: [ :issue| issue hasFix ] ifNone: [ ^ nil ].