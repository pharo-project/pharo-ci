accessing
issueTrackerPublisher
	"If we run on jenkins use a different publisher "
	^ Smalltalk os env 
		at: 'JENKINS_URL'
		ifPresent: [ :value | CIIssueTrackerJenkinsURLPublisher ] 
		ifAbsent: [ CIIssueTrackerPublisher ]
