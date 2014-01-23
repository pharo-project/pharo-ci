protocol
basicLoad
	self isLoadable
		ifFalse: [ Error signal: 'Cannot load this test change' ].
	^ self loadBlock ifNotNil: self loadBlock