loading
load
	| result |
	self assertLoadable.
	result := self basicLoad.
	Smalltalk garbageCollect.
	^ result