action-test
testIssue
	self inform: 'Testing issue ', issue id asString.
	stdout nextPutAll: issue publicUrl; lf.
	self saveTestImage 
		ifTrue: [ "...new session" self loadAndTestIssue ]
		ifFalse: [ "...current session" self spawnTestImage ]