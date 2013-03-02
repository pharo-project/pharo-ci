private
analyzeLabels: col andFill: arguments
	| tags |
	
	(self extractCategoryFrom: col)
		ifNotNil: [:category | arguments at: 'sCategory' put: category ].
		
	(self extractMilestoneFrom: col)
		ifNotNil: [:milestone | arguments at: 'sFixFor' put: milestone ].
		
	(self extractPriorityFrom: col)
		ifNotNil: [:priority | arguments at: 'sPriority' put: priority ].
		
	(self containsHorribleError: col)
		ifTrue: [ arguments at: 'sPriority' put: '1- Show Stopper !!!!!!' ].

	tags := self rejectInvalidLabelsFrom: col.
	tags ifNotEmpty: [	arguments at: 'sTags' put: (tags joinUsing:',') ]