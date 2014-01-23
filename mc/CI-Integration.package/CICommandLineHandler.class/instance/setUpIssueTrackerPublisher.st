setup
setUpIssueTrackerPublisher
	| publisher |
	
	publisher := self isJenkinsJob 
		ifTrue: [ CIIssueTrackerJenkinsURLPublisher new ] 
		ifFalse: [ CIIssueTrackerPublisher new ].
	
	self setHtmlResourcesFor: publisher.
	
	^ publisher