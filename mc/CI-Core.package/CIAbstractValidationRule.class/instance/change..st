accessing
change: anObject
	change := anObject asCIChange.
	self validationResult ifNotNil: [ 
		self validationResult change: change ]