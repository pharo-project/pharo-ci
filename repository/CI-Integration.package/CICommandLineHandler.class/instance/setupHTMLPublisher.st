setup
setupHTMLPublisher
	| publisher |
	publisher := self isJenkinsJob 
				ifFalse: [ CIHTMLPublisher new ]
				ifTrue: [ CIJenkinsHTMLPublisher new ].
	
	(self hasOption: 'html-resources')
		ifTrue: [ publisher bootstrapRoot: (self optionAt: 'html-resources') ].
	
	^ publisher