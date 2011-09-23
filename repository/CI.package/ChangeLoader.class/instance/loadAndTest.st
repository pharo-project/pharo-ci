protocol
loadAndTest
	"load the changesets or the slice for the issue and run tests.
	Note this will update directly notify the issue tracker and add comments."
	
	self issue hasSlice ifTrue: [ ^ self loadAndTestSlice ].
	self issue hasChangeSet ifTrue: [ ^ self loadAndTestChangeSet ].
	
	self errorNoLoadableSources.