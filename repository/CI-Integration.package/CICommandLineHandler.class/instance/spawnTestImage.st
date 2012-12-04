action-test
spawnTestImage
	| osProces |
	self waitForIssueTestTimeout.
	osProces := OSProcess waitForCommand: Smalltalk vm command,' ', self testImage fullName.
	osProces succeeded
		ifTrue: [ self exitSuccess ]
		ifFalse: [ self exitFailure ].