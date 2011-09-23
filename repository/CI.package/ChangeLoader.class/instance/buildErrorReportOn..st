printing
buildErrorReportOn: stream

	errors isEmpty ifTrue: [ ^ self ].
	
	stream << 'Monkey went bananas:'; lf.
	
	errors 
		do: [:e | 
			stream << '--------------------'; lf.
			stream << e ]
		separatedBy: [ stream lf lf]
			