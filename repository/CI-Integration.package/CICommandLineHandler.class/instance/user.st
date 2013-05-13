authentification
user
	user ifNotNil: [ ^ user ].
	user := OSPlatform env at: 'PHARO_CI_USER' ifAbsent: nil.
	^ user