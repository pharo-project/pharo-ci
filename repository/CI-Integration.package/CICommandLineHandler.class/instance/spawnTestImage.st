action-test
spawnTestImage
	| osProces |
	self waitForIssueTestTimeout.
	osProces := OSProcess waitForCommand: Smalltalk vm command,' ', self testImageName.
	osProces isSuccess
		ifTrue: [ self exitSuccess ]
		ifFalse: [ self exitFailure ].