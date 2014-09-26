instance creation
prepare: aCollection

	^ self uniqueInstance
		issueNumbers: aCollection;
		prepare;
		yourself