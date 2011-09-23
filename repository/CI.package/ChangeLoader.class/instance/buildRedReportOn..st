printing
buildRedReportOn: stream
	
	self buildErrorReportOn: stream.
	self buildTestsReportOn: stream.