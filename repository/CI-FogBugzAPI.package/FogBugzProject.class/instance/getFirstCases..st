queries
getFirstCases: number
	^ FogBugzCase buildIssuesFrom: (self getFirstRawCases: number)