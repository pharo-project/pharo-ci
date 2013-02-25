instance creation
buildIssuesFrom: string
	| xml | 

	xml := Soup fromString: string.
	^ (xml findAllTags: 'case') collect: [ :node| self fromXML: node ]