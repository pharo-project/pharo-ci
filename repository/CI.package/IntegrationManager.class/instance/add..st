accessing
add: anIssue
	anIssue integrated
		ifTrue: [ ^ self ].
		
	anIssue load.
	integrated add: anIssue.