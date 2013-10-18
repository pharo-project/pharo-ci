tags
scriptWithSrc: url
	^ self script
		attributeAt: 'src' put: url;
		yourself