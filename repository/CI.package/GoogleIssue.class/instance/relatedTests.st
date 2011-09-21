acessing
relatedTests
	^ relatedTests ifNil: [ relatedTests := self loadRelatedTests ].