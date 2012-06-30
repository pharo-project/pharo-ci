integration
fixToInclude
	"set the status of the issue to FixToInclude"
	self status: PharoTrackerLabels issueChecked.
	^ self submitStatusChange: 'This Issue has been checked by Ulysse the Monkey'.