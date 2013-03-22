setup
password
	password ifNotNil: [ ^ password ].
	password := OSProcess thisOSProcess environment at: 'PHARO_CI_PWD' ifAbsent: nil.
	^ password