printing
buildTestsReportOn: stream

	(testErrors isEmptyOrNil and: [ testFailures isEmptyOrNil])
		ifTrue: [ ^ self ].
	
	stream nextPutAll: 'Test Results:'; lf.
	stream nextPutAll: '-------------'; lf.
			
	testErrors ifNotEmpty: [:collection |
		stream nextPutAll: 'Errors:'; lf.
		collection do: [:e | stream tab print: e; lf ]].
		
	testFailures ifNotEmpty: [:collection |
		stream nextPutAll: 'Failures:'; lf.
		collection do: [:e | stream tab print: e; lf ]]