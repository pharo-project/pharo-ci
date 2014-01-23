helper
publishChanges: aChange
	"Publish an overview + detailed view of the applied changes:
	- changed/added/removed methods
	- changed/added/removed classes
	- changed comments
	- modified packages 
	- detail view of all the changes for the given SLICE and use https://code.google.com/p/google-diff-match-patch/ to visualize the differences
	- create common view/publisher method for the complete changes and the merge conflicts"
	self flag: 'TODO'.