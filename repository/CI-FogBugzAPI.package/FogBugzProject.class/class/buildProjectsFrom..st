instance creation
buildProjectsFrom: string
	| xml | 

	xml := Soup fromString: string.
	^ (xml findAllTags: 'project') collect: [ :node| self fromXML: node ]