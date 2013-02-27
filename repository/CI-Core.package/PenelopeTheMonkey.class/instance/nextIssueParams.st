as yet unclassified
nextIssueParams
	^ String streamContents: [ :s |
		s 
			<< 'can=all'
			<< '&q=-MigratedToFogBugz' ]