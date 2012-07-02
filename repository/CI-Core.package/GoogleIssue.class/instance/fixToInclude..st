integration
fixToInclude: aString
 
	"set the status of the issue to FixToInclude"
	self status: PharoTrackerLabels issueChecked.
	self labels: self labels, {'CheckedIn', Smalltalk lastUpdateString squeezeOutNumber asString }.
	^ self submitStatusChange: 'This Issue has been checked by Ulysse the Monkey
	
', aString.