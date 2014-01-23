validation
timeoutFailure
	self flag: #TODO. "Use a real timeout error".
	self addError: self name, ': Timeout (after ', self timeout asString, ') occured while loading "', self change name, '"'.