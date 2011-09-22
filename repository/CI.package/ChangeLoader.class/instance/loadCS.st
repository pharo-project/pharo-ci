protocol
loadCS

	self issue hasSourceAttachments ifFalse: [ ^ self ].
	
	"load the code and run the test"
	self testChangeImpact: [ 
		self issue sourceAttachments do: [:aString | FileStream fileIn: aString ]].