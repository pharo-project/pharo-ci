asserting
assertLoadable
	self isLoadable
		ifFalse: [ self signalChangeNotFound ]