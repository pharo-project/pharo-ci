protocol
loadAndTest"
	self change hasSlice ifFalse: [ ^ self ].
	"
	^ self testChangeImpact: [ self change loadSlice ].
	