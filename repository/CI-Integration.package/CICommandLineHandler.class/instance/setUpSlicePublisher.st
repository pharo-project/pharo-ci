setup
setUpSlicePublisher
	self shouldUpdateIssue 
		ifFalse: [ ^ CICommandLinePublisher, self setUpHTMLPublisher ].
	"use the default publisher associated with the Slice change provider"
	^ CICommandLinePublisher, self setUpIssueTrackerPublisher