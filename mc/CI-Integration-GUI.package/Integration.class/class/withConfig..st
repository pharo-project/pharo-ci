instance creation
withConfig: aConfig 
	^ self 
		version: aConfig version
		username: aConfig username
		password: aConfig password