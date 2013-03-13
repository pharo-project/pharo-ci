protocol-query
projects
	
	^ projects ifNil: [ projects := self getAllProjects ]