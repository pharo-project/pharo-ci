loading
loadCommentsUntil: aNumber
	| contents doc nodes result |
	
	result := OrderedCollection new.
	1 to: aNumber do: [:idx |
		contents := (self tracker get: (self commentUrlFor: idx)) contents.
		doc := GoogleIssueTracker soupClass fromString: contents.
	
	result add: ((GoogleIssueComment fromXML: doc)
					issue: self;
					yourself) ].
	
	comments := {self description}, result asArray.