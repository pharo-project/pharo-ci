private executing
gitPublish
	| updatesDir files |
	
	updatesDir := self updatesDirectory.
	files := self workingDirectory files 
		select: [ :each | #('cs' 'staged') includes: each extension ].
	
	files do: [ :each | 
		each copyTo: (updatesDir / each basename) ensureDelete. 
		self runCommandWaitForAnswer: ('(cd {1} ; git add {2})' 
			format: { 
				updatesDir fullName.
				each basename } )].
	self runCommandWaitForAnswer: ('(cd {1} ; git commit -m "Version {2}" ; git push origin {3})' 
		format: { 
			updatesDir fullName.
			self buildId.
			self flattenVersion } )