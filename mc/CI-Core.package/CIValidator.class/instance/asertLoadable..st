validation
asertLoadable: aChange
	aChange isLoadable 
		ifTrue: [ ^ self ].
	self publishChangeNotFound: aChange.