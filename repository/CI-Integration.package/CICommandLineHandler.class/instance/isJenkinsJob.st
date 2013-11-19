testing
isJenkinsJob
	 ^ Smalltalk os environment includesKey: 'JENKINS_URL'