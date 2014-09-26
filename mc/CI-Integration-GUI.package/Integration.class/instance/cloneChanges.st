private executing
cloneChanges
	self runCommandWaitForAnswer: ('(git clone -b {1} {2} {3})' 
		format: { 
			self flattenVersion.
			self updatesGitUrl.
			self updatesDirectory fullName })
			