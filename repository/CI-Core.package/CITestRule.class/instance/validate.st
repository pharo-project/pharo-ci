protocol
validate
	^ self block ifNotNil: [ 
		self block cull: self change ]