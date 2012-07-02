integration
labelsWithoutCheckedIn
	^ self labels reject: [ :e | e beginsWith: 'CheckedIn' ]