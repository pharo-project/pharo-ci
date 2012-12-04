action-test
testIssue
	stderr yellow;
		nextPutAll: 'Testing issue '; print: issue id; lf;
		tab; nextPutAll: issue viewUrl;
		flush; clear; lf.
	self saveTestImage 
		ifTrue: [ "...new session" self loadAndTestIssue ]
		ifFalse: [ "...current session" self spawnTestImage ]