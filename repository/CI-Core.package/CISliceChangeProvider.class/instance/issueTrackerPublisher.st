accessing
issueTrackerPublisher
	"If we run on jenkins use a different publisher "
	^ Smalltalk os environment
		at: 'JENKINS_URL'
		ifPresent: [ :value | CIIssueTrackerJenkinsURLPublisher ] 
		ifAbsent: [ CIIssueTrackerPublisher ]
