accessing
issueTrackerPublisher
	"If we run on jenkins use a different publisher "
	^ self isJenkinsJob 
		ifTrue: [ CIIssueTrackerJenkinsURLPublisher ] 
		ifFalse: [ CIIssueTrackerPublisher ]
