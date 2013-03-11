protocol-query
informationAboutProject: id

	^ self sendRequestWithArguments:(Dictionary new
		at: 'cmd' put: 'viewProject';
		at: 'ixProject' put: id asString;
		yourself)