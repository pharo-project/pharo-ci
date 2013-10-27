setup
setUpSlicePublisher
	self shouldUpdateIssue 
		ifFalse: [ ^ CICommandLinePublisher, CIHTMLPublisher ].
	"use the default publisher associated with the Slice change provider"
	^ manager source publisher