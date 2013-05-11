protocol
validate

	^ self modifyResult: (self rule validate: self change)