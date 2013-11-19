setup
setUpSlicePublisher
	self shouldUpdateIssue 
		ifFalse: [ 
			^ CICommandLinePublisher, (self isJenkinsJob 
				ifFalse: [ CIHTMLPublisher ]
				ifTrue: [ CIJenkinsHTMLPublisher ])].
	"use the default publisher associated with the Slice change provider"
	^ manager changeProvider publisher