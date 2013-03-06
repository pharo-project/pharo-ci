*CI-FogBugzAPI
convertStatus: aString arguments: arguments

	aString = 'New' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'Accepted' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'Invalid' ifTrue: [ ^ 'close' -> 'Resolved (Invalid)' ].
	aString = 'Duplicate' ifTrue: [ ^ 'close' -> 'Resolved (Duplicate)' ].
	aString = 'WontFix' ifTrue: [ ^ 'close' -> 'Resolved (Won''t Fix)' ].
	aString = 'Integrated' ifTrue: [ ^ 'close' -> 'Resolved (Integrated)' ].
	aString = 'Closed' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].

	aString = 'FailingTest' ifTrue: [ 
		arguments at: 'sCategory' put: 'Failing Test'.
		^ 'edit' -> 'Active' ].

	aString = 'HumanReviewNeeded' ifTrue: [ ^ 'edit' -> 'Human Review Needed' ].

	aString = 'FixToInclude' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'FixReviewNeeded' ifTrue: [ ^ 'resolve' -> 'Resolved (Review Needed)' ].
	aString = 'MonkeyIsChecking' ifTrue: [ ^ 'resolve' -> 'Resolved (Monkey is checking)' ].
	aString = 'ValidatedByTheMonkey' ifTrue: [ ^ 'resolve' -> 'Resolved (Reviewed by the Monkey)' ].
	aString = 'WorkNeeded' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	aString = 'WorkNeeded-NextAction' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	aString = 'WorkingOn' ifTrue: [ ^ 'edit' -> 'Working On' ].
	aString = 'WorkNeeded-Conclusion' ifTrue: [ ^ 'edit' -> 'Work Needed (Conclusion)' ].
	aString = 'WorkNeeded-NoSources' ifTrue: [ ^ 'edit' -> 'Work Needed (No Sources)' ].
	
	aString = 'CIFixNeeded' ifTrue: [ 
		arguments at: 'sProject' put: 'CI'.
		^ 'edit' -> 'Active' ].
	
	aString = 'WorkNeeded-FailingTest' ifTrue: [ 
		arguments at: 'sCategory' put: 'Failing Test'.
		^ 'edit' -> 'Work Needed' ].
	
	aString = 'OnHold' ifTrue: [ ^ 'edit' -> 'On Hold' ].
	
	"Old and not existing anymore status"
	aString = 'Fixed' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'fixes' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'closed' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].
	aString = 'Verified' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'statusVerified' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'Started' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'fixed' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'Comment' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	aString = 'FixProposed' ifTrue: [ ^ 'resolve' -> 'Resolved (Review Needed)' ].
	aString = 'CLosed' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].	
	aString = 'Clo' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].	
	aString = 'NextActionNeeded' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	aString = 'Workneeded' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	aString = 'open' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'started' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'close' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].	
	aString = 'Open' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'closer' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].	
	aString = 'FixedWaitingToBePharoed' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'clos' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].	
		
	aString = 'accepted' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'PartiallyFixed' ifTrue: [ ^ 'edit' -> 'Work Needed' ].

	aString = 'fixws' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	"stephane.ducasse"
	aString = 'fixced' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'ReviewNeeded' ifTrue: [ ^ 'resolve' -> 'Resolved (Review Needed)' ].
	aString = 'WaitToBePharoed' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'AwaitingReview' ifTrue: [ ^ 'resolve' -> 'Resolved (Review Needed)' ].
	"stephane.ducasse"
	aString = 'Acc' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'Accepter' ifTrue: [ ^ 'edit' -> 'Active' ].	
	aString = 'Accept' ifTrue: [ ^ 'edit' -> 'Active' ].	

	aString = 'Review' ifTrue: [ ^ 'resolve' -> 'Resolved (Review Needed)' ].
	
	
	1halt.