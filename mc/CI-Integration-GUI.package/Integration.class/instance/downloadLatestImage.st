private executing
downloadLatestImage
	self runCommandWaitForAnswer: ('(cd {1} ; curl get.pharo.org/{2} | bash)'
		format: { 
			self workingDirectory fullName.
			self flattenVersion }) 