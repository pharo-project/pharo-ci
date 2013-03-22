setup
user
	user ifNotNil: [ ^ user ].
	user := OSProcess thisOSProcess environment at: 'PHARO_CI_USER' ifAbsent: nil.
	^ user