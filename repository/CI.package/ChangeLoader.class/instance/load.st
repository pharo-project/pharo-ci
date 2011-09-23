protocol
load
	"simply load a slice or changesets associated with the issue.
	Note: this does NOT updae the issue tracker, see loadAndTest for this"
	
	self issue hasSlice ifTrue: [ ^ self loadSlice ].
	self issue hasChangeSet ifTrue: [ ^ self loadChangeSet ].
	
	self errorNoLoadableSources