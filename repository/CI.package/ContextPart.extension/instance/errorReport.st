*CI
errorReport
	^ String streamContents: [ :stream|
		self errorReportOn: stream ].