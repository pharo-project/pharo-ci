initialize
initialize
	"Initialization code for SliceSubmitter"

	super initialize.

	tracker ifNil: [ self initializeTracker ].
		
	issue := GoogleIssue new
				status: PharoTrackerLabels accepted;
				tracker: tracker;
				yourself.
	receiver := World.
	mcPackage := nil.