private executing
prepareEnvironment
	"Prepares the environment for next integration. 
	 - downloads latest pharo image.
	 - updates updates list (sic) from github"
	self logFileReference ensureDelete.
	(self updatesDirectory / '.git') exists 
		ifTrue: [ self updateChanges ]
		ifFalse: [ self cloneChanges ].
	self downloadLatestImage.
		
			
	