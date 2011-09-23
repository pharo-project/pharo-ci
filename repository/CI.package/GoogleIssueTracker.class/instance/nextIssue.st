issues
nextIssue
	
	"choose the next issue to check by ulysse"
	
	| issues |
	
	"try issues which are new and unprrocessed"
	issues := self issuesWithParams: 'can=open&status=FixProposed'.
	issues := issues select: [ :issue| issue hasFix ] inParallel: 10.
	issues := issues sort: [ :a :b | a published < b published].
	issues isEmpty ifFalse: [ ^ issues first ].
	
	
	"try issues which have been marked for review"
	issues := self issuesWithParams: 'can=open&status=ReviewNeeded'.
	issues := issues select: [ :issue| issue hasFix and: [ issue hasToBeChecked ]] inParallel: 10.
	issues := issues sort: [ :a :b | a changed < b changed].
	issues isEmpty ifFalse: [ ^ issues first ].
	
	^ nil