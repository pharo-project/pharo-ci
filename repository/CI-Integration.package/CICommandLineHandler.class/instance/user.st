authentification
user
	user ifNotNil: [ ^ user ].
	user := Smalltalk os environment at: 'PHARO_CI_USER' ifAbsent: nil.
	^ user