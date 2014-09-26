private
fetchLatestVersionOn: integration
	| issuePrefix allPackages |
	
	issuePrefix := 'SLICE-Issue-', self id asString.
	allPackages := Gofer it 
		smalltalkhubUser: 'Pharo' project: integration inboxProjectName;
		allResolved.
		
	^ (allPackages select: [ :each | each packageName beginsWith: issuePrefix ])
		ifNotEmpty: [ :matching | matching last ]
		ifEmpty: [ Error signal: 'No SLICE for issue ', self id asString ]