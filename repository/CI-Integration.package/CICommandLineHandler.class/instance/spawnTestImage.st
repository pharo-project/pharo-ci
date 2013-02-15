action-test
spawnTestImage
	| osProces |
	
	self flag: 'stderr / stdout should be lazily initialized'.
	self initializeStderr; initializeStdout.
	
	self waitForIssueTestTimeout.
	
	self inform: 'Spawning new test image...'.
	osProces := OSProcess waitForCommand: Smalltalk vm command,' ', self testImage fullName.
	osProces succeeded
		ifTrue: [ self exitSuccess ]
		ifFalse: [ self exitFailure ].