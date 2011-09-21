printing
buildErrorReport

	^ String streamContents: [:stream |
		errors ifNotEmpty: [:collection |
			stream << 'Errors:'; lf.
			collection do: [:e | stream tab << e printString. stream lf ]].
			
		failures ifNotEmpty: [:collection |
			stream << 'Failures:'; lf.
			collection do: [:e | stream tab << e printString. stream lf ]]]