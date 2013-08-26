authentification
password
	password ifNotNil: [ ^ password ].
	password := Smalltalk os environment at: 'PHARO_CI_PWD' ifAbsent: nil.
	^ password