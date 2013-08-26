protocol
validate
	self assertHasChange.
	^ self modifyResult: (self rule validate: self change)