authentification
password
	password ifNotNil: [ ^ password ].
	password := OSPlatform env at: 'PHARO_CI_PWD' ifAbsent: nil.
	^ password