private
askForCloseIssues: issues
	^ self confirm: (String streamContents: [ :stream | 
		stream  << 'Integration finished. ' << String cr. 
		stream  << 'Should we close the issues: ' << String cr << String cr.
		issues 
			do: [ :each | stream << Character tab << each asString ]
			separatedBy: [ stream cr ] ])