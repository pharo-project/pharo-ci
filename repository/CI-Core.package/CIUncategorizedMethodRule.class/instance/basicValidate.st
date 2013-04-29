testing
basicValidate
	Smalltalk allClasses do:[ :aClass |
		self addAllWarnings: aClass uncategorizedMethods ]