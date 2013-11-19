setup
setUpSlicePublisher
	self shouldUpdateIssue 
		ifFalse: [ ^ CICommandLinePublisher, self setupHTMLPublisher ].
	"use the default publisher associated with the Slice change provider"
	^ manager changeProvider publisher