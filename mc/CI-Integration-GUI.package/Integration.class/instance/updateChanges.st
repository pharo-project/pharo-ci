private executing
updateChanges
	self runCommandWaitForAnswer: ('(cd {1} ; git pull)' 
		format: { self updatesDirectory fullName })
