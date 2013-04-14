asserting
assertLoadable
	self isLoadable
		ifFalse: [ ChangeNotFound signalChange: self ]