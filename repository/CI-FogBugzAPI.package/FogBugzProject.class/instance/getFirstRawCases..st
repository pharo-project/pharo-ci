queries
getFirstRawCases: number
	| issues index occurrences |
	
	occurrences := 0.
	issues := self rawIssues.
	index := issues findString: 'case ixBug='.
	index = 0 
		ifTrue: [ ^ 0 ].
	
	[ index > 0 and: [ occurrences < number ] ] 
		whileTrue:
			[ 
				occurrences := occurrences + 1.
				index := issues findString: 'case ixBug=' startingAt: index+1 ].

	index = 0 ifTrue: [ ^ issues ].
	^ issues copyFrom: 1 to: index + 1