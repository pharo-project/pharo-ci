integration
fixToInclude
	"set the status of the issue to FixToInclude"

	self status: PharoTrackerLabels issueChecked.
	self labels: self checkedInLabel.
	^ self submitStatusChange