querying
getAllProjects
	| rawProjects |
	
	rawProjects := self sendRequestWithArguments: {'cmd' -> 'listProjects'} asDictionary.
	^ FogBugzProject buildProjectsFrom: rawProjects