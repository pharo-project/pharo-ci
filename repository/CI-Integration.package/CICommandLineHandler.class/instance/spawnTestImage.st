action-test
spawnTestImage
	| osProces |
	"sometimes they are not properly initialized anymore "
	self initializeStderr; initializeStdout.
	
	self waitForIssueTestTimeout.
	
	self inform: 'Spawning new test image...'.
	osProces := OSProcess waitForCommand: Smalltalk vm command,' ', self testImage fullName.
	osProces succeeded
		ifTrue: [ self exitSuccess ]
		ifFalse: [ self exitFailure ].