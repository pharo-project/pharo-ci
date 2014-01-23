accessing
subcases
	
	(subcases anySatisfy: [ :each | each isInteger ])
			ifTrue: [ self loadSubcases ].
	^ subcases