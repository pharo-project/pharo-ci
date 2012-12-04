action-test
testIssue
	stderr yellow;
		nextPutAll: 'Testing issue '; print: issue id; clear; lf;
		tab; nextPutAll: issue viewUrl;
		flush; lf.
	self saveTestImage 
		ifTrue: [ "...new session" self loadAndTestIssue ]
		ifFalse: [ "...current session" self spawnTestImage ]