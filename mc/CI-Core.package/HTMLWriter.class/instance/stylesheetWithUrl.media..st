tags
stylesheetWithUrl: url media: mediaType
	^ (self stylesheetWithUrl: url)
		attributeAt: 'media' put: mediaType;
		yourself