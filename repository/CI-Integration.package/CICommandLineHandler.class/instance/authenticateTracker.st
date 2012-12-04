setup
authenticateTracker
	self googleCodeUser ifNotNil: [
		tracker authenticate: self googleCodeUser with: self googleCodePassword ]