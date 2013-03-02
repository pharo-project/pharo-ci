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
	aString = 'closed' ifTrue: [ ^ 'close' -> 'Resolved (Closed)' ].
	aString = 'Verified' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'statusVerified' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'Started' ifTrue: [ ^ 'edit' -> 'Active' ].
	aString = 'fixed' ifTrue: [ ^ 'resolve' -> 'Resolved (Fix To Include)' ].
	aString = 'Comment' ifTrue: [ ^ 'edit' -> 'Work Needed' ].
	
	1halt.