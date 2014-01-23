queries
getFirstCases: number
	^ FogBugzCase 
		buildIssuesFrom: (self getFirstRawCases: number) 
		tracker: self tracker