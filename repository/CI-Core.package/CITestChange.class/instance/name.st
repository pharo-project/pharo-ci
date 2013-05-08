accessing
name
	^ name ifNil: [ 'TestChange:', self loadBlock asString ]