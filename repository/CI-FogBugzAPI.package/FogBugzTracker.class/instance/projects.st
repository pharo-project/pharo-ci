protocol-query
projects
	
	^ projects ifNil: [ self refreshProjects ]