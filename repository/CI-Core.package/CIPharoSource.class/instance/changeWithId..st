delegating issue tracker
changeWithId: anInteger
	^ CIPharoChange source: self case: (self tracker issueWithId: anInteger)