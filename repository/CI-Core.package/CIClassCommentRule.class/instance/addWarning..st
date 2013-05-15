adding
addWarning: aWarning 
	super addWarning: (String streamContents: [ :stream |
		stream print: aWarning; << ' has no class comment' ])