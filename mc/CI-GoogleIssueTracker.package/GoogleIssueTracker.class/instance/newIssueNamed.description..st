issues
newIssueNamed: aTitleString description: aString
	" create a new issue on myself.
	Example:
		| issue |
		issue := self newIssueNamed: 'foo' description: 'an issue description'.
		issue submit. "

	^ GoogleIssue new
				tracker: self;
				title: aTitleString;
				description: aString;
				status: #Accepted;
				yourself.