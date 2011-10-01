instance creation
prepare: aCollection

	^ self default
		issueNumbers: aCollection;
		prepare;
		yourself