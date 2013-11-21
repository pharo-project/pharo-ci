setup
setUpHTMLPublisher
	| publisher |
	publisher := self isJenkinsJob
		ifFalse: [ CIHTMLPublisher new ]
		ifTrue: [ CIJenkinsHTMLPublisher new ].
	self setHtmlResourcesFor: publisher.
	^ publisher