protocol
loadSlice
	"Load slice and run tests"
	self issue hasSlice ifFalse: [ ^ self ].
	
	"load the slice and run the test"
	self testChangeImpact: [ self issue slice load ].
	