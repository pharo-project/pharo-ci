printing
buildTestsReportOn: stream

	(testErrors isEmptyOrNil and: [ testFailures isEmptyOrNil])
		ifTrue: [ ^ self ].
	
	stream << 'Test Results:'; lf.
	stream << '-------------'; lf.
			
	testErrors ifNotEmpty: [:collection |
		stream << 'Errors:'; lf.
		collection do: [:e | stream tab print: e; lf ]].
		
	testFailures ifNotEmpty: [:collection |
		stream << 'Failures:'; lf.
		collection do: [:e | stream tab print: e; lf ]]