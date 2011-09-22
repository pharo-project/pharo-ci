printing
buildErrorReportOn: stream

	errors isEmpty ifTrue: [ ^ self ].
	
	stream << 'Errors:'; lf.
	stream << '======='; lf.
	
	errors do: [:e | stream tab print: e; lf ]
			