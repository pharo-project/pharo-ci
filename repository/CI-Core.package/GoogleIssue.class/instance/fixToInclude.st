integration
fixToInclude
	"set the status of the issue to FixToInclude"
	self status: #FixToInclude.
	^ self submitStatusChange: 'This Issue has been checked by Ulysse the Monkey'.