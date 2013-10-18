tags
stylesheetWithUrl: url
	^ self stylesheet
		attributeAt: 'href' put: url;
		yourself