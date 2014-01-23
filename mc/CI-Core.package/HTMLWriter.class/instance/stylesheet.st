tags
stylesheet
	^ (self tag: 'link')
		attributeAt: 'rel' put: 'stylesheet';
		yourself